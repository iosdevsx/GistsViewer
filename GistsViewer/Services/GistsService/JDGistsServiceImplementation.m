//
//  JDGistsServiceImplementation.m
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDGistsServiceImplementation.h"
#import "API.h"
#import "PONSOConverter.h"
#import "JDResponseConverter.h"
#import "JDCoreDataService.h"
#import "JDCommit.h"
#import "JDRelation.h"
#import "Gist+CoreDataClass.h"
#import "Commit+CoreDataClass.h"
#import "CommitListResponseObject.h"
#import "GistsListResponseObject.h"
#import "ForksListResponseObject.h"
#import "FilesListResponseObject.h"


@implementation JDGistsServiceImplementation

- (void)getPublicGistsIsCached:(BOOL)isCached
                       success:(void(^)(GistsListResponseObject *response))success
                       failure:(void(^)(NSError *error))failure {
    if (isCached) {
        NSArray *models = [self.coreDataService fetchCachedItemsWithClass:[Gist class]];
        GistsListResponseObject *responseObj = [GistsListResponseObject responseObjectWithGists:models];
        success(responseObj);
    } else {
        [[self.api sessionManager] GET:GistsList parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *error = nil;
            GistsListResponseObject *response = [[GistsListResponseObject alloc] initWithDictionary:[self.responseConverter convertJSONByAddingsFilesKey:responseObject] error:&error];
            
            if (error) {
                failure(error);
                return;
            }
            
            [self.coreDataService cacheItems:response.gists forClass:[Gist class] predicate:nil];
            success(response);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}

- (void)getGistDetailWithId:(NSString *)gistId
                    success:(void(^)(GistsListResponseObject *response))success
                    failure:(void(^)(NSError *error))failure {
    NSString *path = [GistDetail stringByReplacingOccurrencesOfString:@":id" withString:gistId];
    [[self.api sessionManager] GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getGistCommitsWithId:(NSString *)gistId
                    isCached:(BOOL)isCached
                     success:(void(^)(CommitListResponseObject *response))success
                     failure:(void(^)(NSError *error))failure {
    NSString *path = [GistCommits stringByReplacingOccurrencesOfString:@":id" withString:gistId];
    [[self.api sessionManager] GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        NSDictionary *convertedJSON = [self.responseConverter convertedJSONByAddingMainDataKey:responseObject];
        CommitListResponseObject *response = [[CommitListResponseObject alloc] initWithDictionary:convertedJSON error:&error];
        
        if (error) {
            failure(error);
            return;
        }
        
        success(response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)getGistForksWithId:(NSString *)gistId
                   success:(void(^)(ForksListResponseObject *response))success
                   failure:(void(^)(NSError *error))failure {
    //TODO:
}

- (void)getGistFilesWithId:(NSString *)gistId
                   success:(void(^)(FilesListResponseObject *response))succcess
                   failure:(void(^)(NSError *error))failure {
    NSString *path = [GistDetail stringByReplacingOccurrencesOfString:@":id" withString:gistId];
    [[self.api sessionManager] GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        NSDictionary *converted = [self.responseConverter convertedJSONDictionary:responseObject byReplacingDictionaryToArrayByKey:@"files"];
        FilesListResponseObject *response = [[FilesListResponseObject alloc] initWithDictionary:@{@"data":converted} error:&error];
        
        if (error) {
            failure(error);
            return;
        }
        
        succcess(response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
