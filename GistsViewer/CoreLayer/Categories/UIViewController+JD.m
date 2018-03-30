//
//  UIViewController+JD.m
//  GistsViewer
//
//  Created by Юрий Логинов on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "UIViewController+JD.h"
#import "Popup.h"
#import "JDRetryStubView.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation UIViewController (JD)

- (void)jd_showLoader {
    [SVProgressHUD show];
}

- (void)jd_hideLoader {
    [SVProgressHUD dismiss];
}

- (void)jd_showErrorMessage:(NSString *)message {
    [Popup showPopupWithText:message style:PopupStyleError];
}

- (void)jd_showSuccessMessage:(NSString *)message {
    [Popup showPopupWithText:message style:PopupStyleSuccess];
}

- (JDRetryStubView *)jd_showStubViewWithMessage:(NSString *)message
                                    actionBlock:(dispatch_block_t)actionBlock {
    JDRetryStubView *view = [JDRetryStubView viewWithMessage:message actionBlock:actionBlock];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    return view;
}

@end
