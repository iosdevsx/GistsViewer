//
//  DashboardFlowModulesAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "DashboardFlowModulesAssembly.h"
#import "JDDashboardAssembly.h"
#import "JDGistDetailAssembly.h"


@implementation DashboardFlowModulesAssembly

- (id <JDDashboardModuleFactory>)dashboardFactory {
    return [[JDDashboardAssembly assembly] activated];
}
- (id <JDGistDetailModuleFactory>)gistDetailFactory {
    return [[JDGistDetailAssembly assembly] activated];
}

@end
