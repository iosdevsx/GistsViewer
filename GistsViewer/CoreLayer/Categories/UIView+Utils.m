//
//  UIView+Utils.m
//  GistsViewer
//
//  Created by Юрий Логинов on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

+ (instancetype)loadNib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

@end
