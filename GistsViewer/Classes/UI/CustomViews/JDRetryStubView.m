//
//  JDRetryStubView.m
//  GistsViewer
//
//  Created by Юрий Логинов on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDRetryStubView.h"


@interface JDRetryStubView()

@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (nonatomic, copy) dispatch_block_t action;

@end

@implementation JDRetryStubView

+ (instancetype)viewWithMessage:(NSString *)message
                    actionBlock:(dispatch_block_t)actionBlock {
    JDRetryStubView *view = [JDRetryStubView loadNib];
    view.errorLabel.text = message;
    view.action = actionBlock;
    return view;
}

- (IBAction)actionRetryTap:(UIButton *)sender {
    if (self.action) {
        self.action();
    }
}


@end
