//
//  AppDelegate.h
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coordinator.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id <Coordinator> appCoordinator;

@end

