//
//  ApplicationAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 21.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "ApplicationCoordinatorImplementation.h"
#import "AppDelegate.h"
#import "JDDashboardAssembly.h"


@interface ApplicationAssembly()

@property (nonatomic, strong) JDDashboardAssembly *dashboardAssembly;

@end

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(window) with:[self window]];
        [definition injectProperty:@selector(appCoordinator) with:[self applicationCoordinator]];
    }];
}

- (id <ApplicationCoordinator>)applicationCoordinator {
    return [TyphoonDefinition withClass:[ApplicationCoordinatorImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(dashboardFactory) with:self.dashboardAssembly];
        [definition injectProperty:@selector(appDelegate) with:[self appDelegate]];
    }];
}

- (UIWindow *)window {
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
        }];
    }];
}

@end
