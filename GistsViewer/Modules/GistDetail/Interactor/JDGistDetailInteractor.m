//
//  JDGistDetailInteractor.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailInteractor.h"
#import "JDGistDetailInteractorOutput.h"
#import "JDGistsService.h"
#import "JDGist.h"
#import "CommitListResponseObject.h"
#import "FilesListResponseObject.h"


@implementation JDGistDetailInteractor

#pragma mark - Методы JDGistDetailInteractorInput

- (void)fetchCommitsForGist:(JDGist *)gist {
    __weak typeof(self) wself = self;
    [self.gistsService getGistCommitsWithId:gist.id isCached:NO success:^(CommitListResponseObject *response) {
        [wself.output commitsFetched:response.commits];
    } failure:^(NSError *error) {
        [wself.output commitsFetchFailed:error.localizedDescription];
    }];
}

- (void)fetchFilesForGist:(JDGist *)gist {
    __weak typeof(self) wself = self;
    [self.gistsService getGistFilesWithId:gist.id success:^(FilesListResponseObject *response) {
        [wself.output filesFetched:response.files];
    } failure:^(NSError *error) {
        [wself.output filesFetchFailed:error.localizedDescription];
    }];
}

@end
