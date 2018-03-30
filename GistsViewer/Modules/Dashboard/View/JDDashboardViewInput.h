//
//  JDDashboardViewInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDDashboardViewInput <NSObject>

- (void)setupInitialStateWithGistsList:(UIViewController *)gistsListController;
- (void)addUsersHeader:(UIViewController *)usersHeaderController;

@end
