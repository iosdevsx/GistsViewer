//
//  GistsListCoordinator.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "BaseCoordinator.h"
#import "Router.h"

@interface GistsListCoordinator : BaseCoordinator

@property (nonatomic, weak) id <Router> router;

@end
