//
//  BaseCoordinator.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"

@interface BaseCoordinator : NSObject <Coordinator>

@property (nonatomic, strong) NSMutableArray <Coordinator> *childCoordinators;

- (void)addCoordinator:(id <Coordinator>)childCoordinator;
- (void)removeCoordinator:(id <Coordinator>)childCoordinator;

@end
