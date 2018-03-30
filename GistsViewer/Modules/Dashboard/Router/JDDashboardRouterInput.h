//
//  JDDashboardRouterInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDGistsListModuleInput.h"
#import "JDUsersHeaderModuleInput.h"
#import "JDGistsListModuleOutput.h"
#import "JDUsersHeaderModuleOutput.h"

@class JDOwner;
@class JDGist;

@protocol JDDashboardRouterInput <NSObject>

- (void)openGistsListModuleForUser:(JDOwner *)user;

- (id <JDGistsListModuleInput>)presenterGistsListWithOutputPoint:(id <JDGistsListModuleOutput>)output;
- (id <JDUsersHeaderModuleInput>)presenterUsersHeaderWithOutputPoint:(id <JDUsersHeaderModuleOutput>)output;

@end
