//
//  BaseCoordinator.m
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "BaseCoordinator.h"

@implementation BaseCoordinator

-(void)start {
    
}

- (void)addCoordinator:(id <Coordinator>)childCoordinator {
    for (id <Coordinator> coordinator in self.childCoordinators) {
        if ([childCoordinator isEqual:coordinator]) {
            return;
        }
    }
    [self.childCoordinators addObject:childCoordinator];
}

- (void)removeCoordinator:(id <Coordinator>)childCoordinator {
    if (self.childCoordinators.count == 0) {
        return;
    }
    for (id <Coordinator> coordinator in self.childCoordinators) {
        if ([childCoordinator isEqual:coordinator]) {
            [self.childCoordinators removeObject:coordinator];
            break;
        }
    }
}

@end
