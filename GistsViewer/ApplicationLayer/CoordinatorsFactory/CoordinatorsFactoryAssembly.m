//
//  CoordinatorsFactoryAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "CoordinatorsFactoryAssembly.h"
#import "CoordinatorsFactory.h"
#import "Coordinator.h"
#import "DashboardCoordinator.h"
#import "JDDashboardAssembly.h"
#import "JDGistDetailAssembly.h"
#import "GistsListCoordinator.h"


@interface CoordinatorsFactoryAssembly()

@property (nonatomic, strong) JDDashboardAssembly *dashboardAssembly;
@property (nonatomic, strong) JDGistDetailAssembly *gistDetailAssembly;

@end

@implementation CoordinatorsFactoryAssembly

- (id <Coordinator>)dashboardCoordinatorWithRouter:(id <Router>)router
                                           factory:(id <CoordinatorsFactory>)factory {
    return [TyphoonDefinition withClass:[DashboardCoordinator class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(router) with:router];
        [definition injectProperty:@selector(factory) with:factory];
        [definition injectProperty:@selector(dashboardFactory) with:self.dashboardAssembly];
        [definition injectProperty:@selector(gistDetailFactory) with:self.gistDetailAssembly];
    }];
}

- (id <Coordinator>)gistsListCoordinatorWithRouter:(id <Router>)router {
    return [TyphoonDefinition withClass:[GistsListCoordinator class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(router) with:router];
    }];
}

@end
