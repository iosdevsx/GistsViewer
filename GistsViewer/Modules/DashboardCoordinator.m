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
#import "JDDashboardModuleOutput.h"
#import "GistsListCoordinator.h"


@interface DashboardCoordinator() <JDDashboardModuleOutput>

@end

@implementation DashboardCoordinator

- (void)start {
    [self showDashboard];
}

- (void)showDashboard {
    id <JDDashboardModuleInput> presenter = [self.dashboardFactory presenterDashboard];
    [presenter configureModuleWithOutput:self];
    [self.router setRootModule:presenter.view];
}

- (void)userSelected:(JDOwner *)user {
    
}

- (void)runGistsListFlow {
    
}

@end
