//
//  JDUsersService.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDGist;
@class JDOwner;
@class GistsListResponseObject;

@protocol JDUsersService <NSObject>

- (void)fetchGistsForUser:(JDOwner *)user
                 isCached:(BOOL)isCached
                  success:(void(^)(GistsListResponseObject *response))success
                  failure:(void(^)(NSError *error))failure;

- (void)fetchUsersWithGists:(NSArray *)gists
                   isCached:(BOOL)isCached
             withCompletion:(void(^)(NSArray *users))completion;

@end
