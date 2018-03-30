//
//  JDUsersServiceImplementation.m
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDUsersServiceImplementation.h"
#import "API.h"
#import "PONSOConverter.h"
#import "JDCoreDataService.h"
#import "JDResponseConverter.h"
#import "JDOwner.h"
#import "JDGist.h"
#import "JDRelation.h"
#import "Owner+CoreDataClass.h"
#import "Gist+CoreDataClass.h"
#import "GistsListResponseObject.h"
#import <MagicalRecord/MagicalRecord.h>


static NSString *const kLoginKey = @"login";
static NSString *const kPredicateFormat = @"owner = %@";

@implementation JDUsersServiceImplementation

- (void)fetchGistsForUser:(JDOwner *)user
                 isCached:(BOOL)isCached
                  success:(void(^)(GistsListResponseObject *response))success
                  failure:(void(^)(NSError *error))failure {
    if (isCached) {
        [self predicateWithUserLogin:user.login result:^(Owner *currentUser, NSPredicate *predicate) {
            NSArray *models = [self.coreDataService fetchItemsRelatedTo:[Gist class] withPredicate:predicate];
            GistsListResponseObject *response = [GistsListResponseObject responseObjectWithGists:models];
            success(response);
        }];
    } else {
        NSString *path = [UserPublicGists stringByReplacingOccurrencesOfString:@":id" withString:user.login];
        [[self.api sessionManager] GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *error = nil;
            GistsListResponseObject *response = [[GistsListResponseObject alloc] initWithDictionary:[self.responseConverter convertJSONByAddingsFilesKey:responseObject] error:&error];
            
            if (error) {
                failure(error);
                return;
            }
            
            [self predicateWithUserLogin:user.login result:^(Owner *currentUser, NSPredicate *predicate) {
                [self.coreDataService cacheItems:response.gists
                                        forClass:[Gist class]
                                       predicate:predicate
                                        relation:[self relationForUser:currentUser]];
            }];
            
            success(response);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

- (void)fetchUsersWithGists:(NSArray *)gists isCached:(BOOL)isCached withCompletion:(void(^)(NSArray *users))completion {
    __block NSMutableArray *usersWithGists = [NSMutableArray array];
    
    dispatch_group_t usersGroup = dispatch_group_create();
    
    for (JDOwner *user in [self getUsersFromGists:gists]) {
        dispatch_group_enter(usersGroup);
        [self fetchGistsForUser:user isCached:isCached success:^(GistsListResponseObject *response) {
            JDOwner *userWithGists = user;
            userWithGists.gists = response.gists;
            
            @synchronized(self) {
                [usersWithGists addObject:userWithGists];
            }
            dispatch_group_leave(usersGroup);
        } failure:^(NSError *error) {
            dispatch_group_leave(usersGroup);
        }];
    }
    
    dispatch_group_notify(usersGroup, dispatch_get_main_queue(), ^{
        completion([self sortedUsers:usersWithGists]);
    });
}

#pragma mark - Private

- (NSArray *)getUsersFromGists:(NSArray *)gists {
    NSMutableArray *users = [NSMutableArray array];
    
    for (JDGist *gist in gists) {
        [users addObject:gist.owner];
    }
    
    NSArray *filteredUsers = [users filteredArrayByKey:kLoginKey];
    
    return filteredUsers;
}

- (NSArray *)sortedUsers:(NSArray *)users {
    return [users sortedArrayUsingComparator:^NSComparisonResult(JDOwner *_Nonnull obj1, JDOwner *_Nonnull obj2) {
        if (obj1.gists.count > obj2.gists.count) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
}

- (JDRelation *)relationForUser:(id)user {
    return [JDRelation relationWithItem:user selector:@selector(addGist:)];
}

- (void)predicateWithUserLogin:(NSString *)userLogin result:(void(^)(Owner *currentUser, NSPredicate *predicate))result {
    Owner *currentOwner = [Owner MR_findFirstByAttribute:kLoginKey withValue:userLogin];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:kPredicateFormat, currentOwner];
    result(currentOwner, predicate);
}


@end
