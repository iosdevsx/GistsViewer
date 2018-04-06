//
//  ApplicationCoordinator.m
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "ApplicationCoordinator.h"

@interface ApplicationCoordinator()

@property (nonatomic, strong) id <CoordinatorsFactory> coordinatorsFactory;
@property (nonatomic, strong) id <Router> router;

@end

@implementation ApplicationCoordinator

- (instancetype)initWithFactory:(id<CoordinatorsFactory>)factory
                        router:(id<Router>)router {
    self = [super init];
    if (self) {
        self.coordinatorsFactory = factory;
        self.router = router;
    }
    return self;
}

-(void)start {
    [self runMainFlow];
}

- (void)runMainFlow {
    id <Coordinator> dashboardCoordinator = [self.coordinatorsFactory dashboardCoordinatorWithRouter:self.router];
    [self addCoordinator:dashboardCoordinator];
    [dashboardCoordinator start];
}

@end
