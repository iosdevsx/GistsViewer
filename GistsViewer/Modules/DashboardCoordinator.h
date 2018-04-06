//
//  DashboardCoordinator.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoordinator.h"
#import "Router.h"
#import "DashboardFlowModulesFactory.h"
#import "DashboardCoordinatorOutput.h"


@protocol JDDashboardModuleFactory;
@protocol JDGistDetailModuleFactory;

@interface DashboardCoordinator : BaseCoordinator, DashboardCoordinatorOutput

@property (nonatomic, strong) id <Router> router;
//@property (nonatomic, strong) id <DashboardFlowModulesFactory> factory;

@property (nonatomic, strong) id <JDDashboardModuleFactory> dashboardFactory;
@property (nonatomic, strong) id <JDGistDetailModuleFactory> gistDetailFactory;

@end
