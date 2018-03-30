//
//  JDCommitListModuleInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JDCommitListModuleInput

- (void)configureModuleWithCommits:(NSArray *)commits;

- (UIViewController *)view;

@end
