//
//  JDDashboardPresenter.m
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardPresenter.h"
#import "JDDashboardViewInput.h"
#import "JDDashboardInteractorInput.h"
#import "JDDashboardRouterInput.h"
#import "JDGistsListModuleInput.h"
#import "JDGistsListModuleOutput.h"
#import "JDUsersHeaderModuleInput.h"
#import "JDUsersHeaderModuleOutput.h"


@interface JDDashboardPresenter() <JDGistsListModuleOutput, JDUsersHeaderModuleOutput>

@property (nonatomic, strong) id <JDGistsListModuleInput> presenterGistsList;
@property (nonatomic, strong) id <JDUsersHeaderModuleInput> presenterUsers;

@property (nonatomic, strong) NSArray *users;

@end

@implementation JDDashboardPresenter

#pragma mark - Методы JDDashboardModuleInput

- (void)configureModule {
    self.presenterGistsList = [self.router presenterGistsListWithOutputPoint:self];
    self.presenterUsers = [self.router presenterUsersHeaderWithOutputPoint:self];
}

#pragma mark - Методы JDDashboardViewOutput

- (void)didTriggerViewReadyEvent {
    [self.view setupInitialStateWithGistsList:self.presenterGistsList.view];
}

#pragma mark - Методы JDDashboardInteractorOutput

- (void)usersFetched:(NSArray *)users {
    if (users.count > 0) {
        self.users = users;
        [self.view addUsersHeader:self.presenterUsers.view];
        [self.presenterUsers setupUsers:self.users];
    }
}

#pragma mark - JDGistsListModuleOutput

- (void)gistsLoaded:(NSArray *)gists isCached:(BOOL)isCached {
    [self.interactor fetchUserListForGists:gists isCached:isCached];
}

#pragma mark - JDUsersHeaderModuleOutput

- (void)selectedUser:(JDOwner *)user {
    [self.router openGistsListModuleForUser:user];
}

@end
