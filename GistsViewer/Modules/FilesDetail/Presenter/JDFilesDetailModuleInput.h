//
//  JDFilesDetailModuleInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol JDFilesDetailModuleInput

- (UIViewController *)view;

- (void)configureModuleWithFileContent:(NSString *)content;

@end
