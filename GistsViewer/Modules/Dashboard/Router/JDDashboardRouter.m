//
//  JDDashboardRouter.m
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardRouter.h"
#import "JDGistsListModuleFactory.h"
#import "JDGistsListModuleInput.h"
#import "JDUsersHeaderModuleFactory.h"
#import "JDUsersHeaderModuleInput.h"
#import "JDOwner.h"

@implementation JDDashboardRouter

#pragma mark - Методы JDDashboardRouterInput

- (void)openGistsListModuleForUser:(JDOwner *)user {
    id <JDGistsListModuleInput> presenter = self.factoryGistsList.presenterGistsList;
    [presenter configureModuleWithUser:user];
    [self.viewController.navigationController pushViewController:presenter.view animated:YES];
}

- (id <JDGistsListModuleInput>)presenterGistsListWithOutputPoint:(id <JDGistsListModuleOutput>)output {
    id <JDGistsListModuleInput> presenter = self.factoryGistsList.presenterGistsList;
    [presenter configureModuleWithOutputPoint:output];
    return presenter;
}

- (id <JDUsersHeaderModuleInput>)presenterUsersHeaderWithOutputPoint:(id <JDUsersHeaderModuleOutput>)output {
    id <JDUsersHeaderModuleInput> presenter = self.factoryUsersList.presenterUsersHeader;
    [presenter configureModuleWithOutputPoint:output];
    return presenter;
}

@end
