//
//  JDFilesListRouter.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesListRouterInput.h"
#import <UIKit/UIKit.h>


@protocol JDFilesDetailModuleFactory;

@interface JDFilesListRouter : NSObject <JDFilesListRouterInput>

@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) id <JDFilesDetailModuleFactory> factoryFilesDetail;

@end
