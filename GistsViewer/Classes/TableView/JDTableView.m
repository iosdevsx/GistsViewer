//
//  JDTableView.m
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDTableView.h"

@implementation JDTableView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self jd_setupTable];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self jd_setupTable];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self jd_setupTable];
    }
    return self;
}

- (void)jd_setupTable {
    self.estimatedSectionHeaderHeight = 0;
    self.estimatedSectionFooterHeight = 0;
    self.estimatedRowHeight = 70.0f;
    self.rowHeight = UITableViewAutomaticDimension;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.showsVerticalScrollIndicator = NO;
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}

@end
