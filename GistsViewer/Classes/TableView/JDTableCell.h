//
//  JDTableCell.h
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDTableCell : UITableViewCell

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, copy) dispatch_block_t actionBlock;

+ (instancetype)cellWithStyle:(UITableViewCellStyle)style height:(CGFloat)height actionBlock:(dispatch_block_t)actionBlock;

@end
