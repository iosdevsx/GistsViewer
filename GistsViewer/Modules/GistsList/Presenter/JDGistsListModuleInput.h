//
//  JDGistsListModuleInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDGistsListModuleOutput.h"
#import <UIKit/UIKit.h>

@class JDOwner;

@protocol JDGistsListModuleInput

- (UIViewController *)view;

- (void)configureModuleWithOutputPoint:(id <JDGistsListModuleOutput>)output;
- (void)configureModuleWithUser:(JDOwner *)user;

- (void)fetchAllPublicGists;
- (void)fetchAllPublicGistsForUser:(JDOwner *)user;

@end
