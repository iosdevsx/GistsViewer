//
//  GistsService.h
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GistsListResponseObject;
@class CommitListResponseObject;
@class ForksListResponseObject;
@class FilesListResponseObject;

@protocol JDGistsService <NSObject>

- (void)getPublicGistsIsCached:(BOOL)isCached
                       success:(void(^)(GistsListResponseObject *response))success
                       failure:(void(^)(NSError *error))failure;

- (void)getGistDetailWithId:(NSString *)gistId
                    success:(void(^)(GistsListResponseObject *response))success
                    failure:(void(^)(NSError *error))failure;

- (void)getGistCommitsWithId:(NSString *)gistId
                    isCached:(BOOL)isCached
                     success:(void(^)(CommitListResponseObject *response))success
                     failure:(void(^)(NSError *error))failure;

- (void)getGistForksWithId:(NSString *)gistId
                   success:(void(^)(ForksListResponseObject *response))success
                   failure:(void(^)(NSError *error))failure;

- (void)getGistFilesWithId:(NSString *)gistId
                   success:(void(^)(FilesListResponseObject *response))succcess
                   failure:(void(^)(NSError *error))failure;
@end
