//
//  CoordinatorsFactory.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"
#import "Router.h"

@protocol CoordinatorsFactory <NSObject>

- (id <Coordinator>)dashboardCoordinatorWithRouter:(id <Router>)router;

@end
