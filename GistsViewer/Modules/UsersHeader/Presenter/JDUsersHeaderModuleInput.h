//
//  JDUsersHeaderModuleInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol JDUsersHeaderModuleOutput;

@protocol JDUsersHeaderModuleInput

- (UIViewController *)view;

- (void)configureModuleWithOutputPoint:(id <JDUsersHeaderModuleOutput>)output;
- (void)setupUsers:(NSArray *)users;

@end
