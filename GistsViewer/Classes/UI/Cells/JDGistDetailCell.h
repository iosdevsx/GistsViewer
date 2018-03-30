//
//  JDGistDetailCell.h
//  GistsViewer
//
//  Created by Yury Loginov on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDTableCell.h"
#import "Enums.h"

@interface JDGistDetailCell : JDTableCell

+ (instancetype)cellWithType:(DetailType)type
                    leftText:(NSString *)leftText
                   rightText:(NSString *)rightText;

- (void)updateRightText:(NSString *)text;

- (void)showLoading;
- (void)hideLoading;

@end
