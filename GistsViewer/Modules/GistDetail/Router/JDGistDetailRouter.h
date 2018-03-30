//
//  JDGistDetailRouter.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailRouterInput.h"
#import <UIKit/UIKit.h>

@protocol JDCommitListModuleFactory;
@protocol JDFilesListModuleFactory;

@interface JDGistDetailRouter : NSObject <JDGistDetailRouterInput>

@property (nonatomic, strong) id <JDCommitListModuleFactory> factoryCommitList;
@property (nonatomic, strong) id <JDFilesListModuleFactory> factoryFilesList;

@property (nonatomic, strong) UIViewController *viewController;

@end
