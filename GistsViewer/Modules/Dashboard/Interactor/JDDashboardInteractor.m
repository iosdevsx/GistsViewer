//
//  JDDashboardInteractor.m
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardInteractor.h"
#import "JDDashboardInteractorOutput.h"
#import "JDGistsService.h"
#import "GistsListResponseObject.h"
#import "JDGist.h"
#import "JDOwner.h"
#import "JDUsersService.h"

@implementation JDDashboardInteractor

#pragma mark - Методы JDDashboardInteractorInput

- (void)fetchUserListForGists:(NSArray *)gists isCached:(BOOL)isCached {
    __weak typeof(self) weakSelf = self;
    
    [self.userService fetchUsersWithGists:gists isCached:isCached withCompletion:^(NSArray *users) {
        [weakSelf.output usersFetched:users];
    }];
}

@end
