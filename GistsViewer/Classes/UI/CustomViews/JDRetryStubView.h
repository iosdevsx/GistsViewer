//
//  JDRetryStubView.h
//  GistsViewer
//
//  Created by Юрий Логинов on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDRetryStubView : UIView

+ (instancetype)viewWithMessage:(NSString *)message
                    actionBlock:(dispatch_block_t)actionBlock;

@end
