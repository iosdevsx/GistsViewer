//
//  JDDashboardModuleOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDOwner;

@protocol JDDashboardModuleOutput <NSObject>

- (void)userSelected:(JDOwner *)user;

@end
