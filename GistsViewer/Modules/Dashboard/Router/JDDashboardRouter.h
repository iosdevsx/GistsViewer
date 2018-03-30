//
//  JDDashboardRouter.h
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardRouterInput.h"

@protocol JDGistsListModuleFactory;
@protocol JDUsersHeaderModuleFactory;
@protocol JDGistDetailModuleFactory;

@interface JDDashboardRouter : NSObject <JDDashboardRouterInput>

@property (nonatomic, strong) id <JDGistsListModuleFactory> factoryGistsList;
@property (nonatomic, strong) id <JDUsersHeaderModuleFactory> factoryUsersList;


@property (nonatomic, strong) UIViewController *viewController;

@end
