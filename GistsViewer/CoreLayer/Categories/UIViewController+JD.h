//
//  UIViewController+JD.h
//  GistsViewer
//
//  Created by Юрий Логинов on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDRetryStubView;

@interface UIViewController (JD)

- (void)jd_showLoader;
- (void)jd_hideLoader;

- (void)jd_showErrorMessage:(NSString *)message;
- (void)jd_showSuccessMessage:(NSString *)message;

- (JDRetryStubView *)jd_showStubViewWithMessage:(NSString *)message
                                    actionBlock:(dispatch_block_t)actionBlock;

@end
