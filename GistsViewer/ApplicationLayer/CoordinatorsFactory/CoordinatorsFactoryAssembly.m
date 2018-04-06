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
#import "DashboardFlowModulesAssembly.h"
#import "JDDashboardAssembly.h"
#import "JDGistDetailAssembly.h"


@interface CoordinatorsFactoryAssembly()

@property (nonatomic, strong) JDDashboardAssembly *dashboardAssembly;
@property (nonatomic, strong) JDGistDetailAssembly *gistDetailAssembly;

@end

@implementation CoordinatorsFactoryAssembly

- (id<Coordinator>)dashboardCoordinatorWithRouter:(id<Router>)router {
    return [TyphoonDefinition withClass:[DashboardCoordinator class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(router) with:router];
        [definition injectProperty:@selector(dashboardFactory) with:self.dashboardAssembly];
        [definition injectProperty:@selector(gistDetailFactory) with:self.gistDetailAssembly];
    }];
}

@end
