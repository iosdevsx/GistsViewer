//
//  ApplicationCoordinatorImplementation.h
//  GistsViewer
//
//  Created by Yury Loginov on 21.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApplicationCoordinator.h"

@protocol JDDashboardModuleFactory;
@class AppDelegate;

@interface ApplicationCoordinatorImplementation : NSObject <ApplicationCoordinator>

@property (nonatomic, strong) id <JDDashboardModuleFactory> dashboardFactory;
@property (nonatomic, weak) AppDelegate *appDelegate;

@end
