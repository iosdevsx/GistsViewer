//
//  RouterImplementation.m
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "RouterImplementation.h"
#import "Presentable.h"


@interface RouterImplementation()

@property (nonatomic, weak) UINavigationController *rootViewController;

@end


@implementation RouterImplementation

- (instancetype)initWithRootViewController:(UINavigationController *)rootController {
    self = [super init];
    if (self) {
        self.rootViewController = rootController;
    }
    return self;
}

- (void)present:(id <Presentable>)module animated:(BOOL)animated {
    UIViewController *controller = [module toPresent];
    if (!controller) {
        return;
    }
    [self.rootViewController presentViewController:controller animated:animated completion:nil];
}

- (void)dismissModuleAnimated:(BOOL)animated {
    [self.rootViewController dismissViewControllerAnimated:animated completion:nil];
}

- (void)push:(id <Presentable>)module animated:(BOOL)animated {
    UIViewController *controller = [module toPresent];
    if (!controller) {
        return;
    }
    [self.rootViewController pushViewController:controller animated:animated];
}

- (void)popModuleAnimated:(BOOL)animated {
    [self.rootViewController popViewControllerAnimated:animated];
}

- (void)setRootModule:(id <Presentable>)module {
    UIViewController *controller = [module toPresent];
    if (!controller) {
        return;
    }
    [self.rootViewController setViewControllers:@[controller] animated:NO];
}

@end
