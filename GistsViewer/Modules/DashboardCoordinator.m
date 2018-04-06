//
//  DashboardCoordinator.m
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "DashboardCoordinator.h"
#import "JDDashboardModuleFactory.h"
#import "JDDashboardModuleInput.h"


@interface DashboardCoordinator()

@end

@implementation DashboardCoordinator

- (void)start {
    [self showDashboard];
}

- (void)showDashboard {
//    id <JDDashboardModuleFactory> dashboardFactory = [self.factory dashboardFactory];
    id <JDDashboardModuleInput> presenter = [self.dashboardFactory presenterDashboard];
    [presenter configureModule];
    [self.router setRootModule:presenter.view];
}

@end
