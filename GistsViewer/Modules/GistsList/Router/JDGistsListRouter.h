//
//  JDGistsListRouter.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListRouterInput.h"
#import <UIKit/UIKit.h>

@protocol JDGistDetailModuleFactory;

@interface JDGistsListRouter : NSObject <JDGistsListRouterInput>

@property (nonatomic, strong) id <JDGistDetailModuleFactory> factoryGistDetail;
@property (nonatomic, strong) UIViewController *viewController;

@end
