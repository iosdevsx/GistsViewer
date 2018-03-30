//
//  JDGistDetailModuleInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDGist.h"
#import <UIKit/UIKit.h>


@protocol JDGistDetailModuleInput

- (UIViewController *)view;

- (void)configureModuleWithGist:(JDGist *)gist;

@end
