//
//  ApplicationCoordinatorImplementation.m
//  GistsViewer
//
//  Created by Yury Loginov on 21.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "ApplicationCoordinatorImplementation.h"
#import "JDDashboardModuleFactory.h"
#import "JDDashboardModuleInput.h"
#import "AppDelegate.h"

@implementation ApplicationCoordinatorImplementation

- (void)startApplicationSession {
    id <JDDashboardModuleInput> presenter = self.dashboardFactory.presenterDashboard;
    [presenter configureModule];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:presenter.view];
    [self changeRootController:navController];
}

- (void)changeRootController:(UIViewController *)controller {
    self.appDelegate.window.rootViewController = controller;
}

@end
