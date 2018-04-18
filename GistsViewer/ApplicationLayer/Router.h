//
//  Router.h
//  GistsViewer
//
//  Created by Yury Loginov on 06.04.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Presentable.h"

@protocol Router <NSObject>

- (void)present:(id <Presentable>)module animated:(BOOL)animated;
- (void)dismissModuleAnimated:(BOOL)animated;

- (void)push:(id <Presentable>)module animated:(BOOL)animated;
- (void)popModuleAnimated:(BOOL)animated;

- (void)setRootModule:(id <Presentable>)module;

@end
