//
//  DashboardFlowModulesFactory.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDDashboardModuleFactory;
@protocol JDGistDetailModuleFactory;

@protocol DashboardFlowModulesFactory <NSObject>

- (id <JDDashboardModuleFactory>)dashboardFactory;
- (id <JDGistDetailModuleFactory>)gistDetailFactory;

@end
