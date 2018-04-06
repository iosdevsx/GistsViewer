//
//  ApplicationCoordinator.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoordinator.h"
#import "CoordinatorsFactory.h"
#import "Router.h"


@interface ApplicationCoordinator : BaseCoordinator

-(instancetype)initWithFactory:(id <CoordinatorsFactory>)factory
                        router:(id <Router>)router;

@end
