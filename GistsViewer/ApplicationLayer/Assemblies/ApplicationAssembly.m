//
//  ApplicationAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 21.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "AppDelegate.h"
#import "Coordinator.h"
#import "ApplicationCoordinator.h"
#import "CoordinatorsFactory.h"
#import "Router.h"
#import "RouterImplementation.h"
#import "CoordinatorsFactoryAssembly.h"


@interface ApplicationAssembly()

@property (nonatomic, strong) CoordinatorsFactoryAssembly *coordinatorsAssembly;

@end

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(window) with:[self window]];
        [definition injectProperty:@selector(appCoordinator) with:[self applicationCoordinator]];
    }];
}

- (id <Coordinator>)applicationCoordinator {
    return [TyphoonDefinition withClass:[ApplicationCoordinator class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFactory:router:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:self.coordinatorsAssembly];
            [initializer injectParameterWith:[self router]];
        }];
    }];
}

- (id <Router>)router {
    return [TyphoonDefinition withClass:[RouterImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRootViewController:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self rootController]];
        }];
    }];
}

- (UIWindow *)window {
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
        }];
        [definition injectProperty:@selector(rootViewController) with:[self rootController]];
    }];
}

- (UINavigationController *)rootController {
    return [TyphoonDefinition withClass:[UINavigationController class]];
}

@end
