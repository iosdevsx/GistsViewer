//
//  JDDashboardModuleFactory.h
//  GistsViewer
//
//  Created by Yury Loginov on 21.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDDashboardModuleInput.h"

@protocol JDDashboardModuleFactory <NSObject>

- (id <JDDashboardModuleInput>)presenterDashboard;

@end
