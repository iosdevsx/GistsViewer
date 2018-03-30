//
//  JDTableSection.m
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDTableSection.h"

@implementation JDTableSection

+ (instancetype)sectionWithCells:(NSArray *)cells {
    return [[self class] sectionWithHeaderTitle:nil headerView:nil headerHeight:UITableViewAutomaticDimension footerTitle:nil footerView:nil footerHeight:UITableViewAutomaticDimension cells:cells];
}

+ (instancetype)sectionSupportingReuseWithTitle:(NSString *)title
                                      cellCount:(NSInteger)cellCount
                                     cellHeight:(CGFloat)cellHeight
                                cellForRowBlock:(CellForRowBlock)cellForRowBlock
                                    actionBlock:(CellActionBlock)actionBlock {
    return [[[self class] alloc] initSectionSupportingReuseWithTitle:title cellCount:cellCount cellHeight:cellHeight cellForRowBlock:cellForRowBlock actionBlock:actionBlock];
}

+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle cells:(NSArray *)cells {
    return [[self class] sectionWithHeaderTitle:headerTitle headerView:nil headerHeight:UITableViewAutomaticDimension footerTitle:nil footerView:nil footerHeight:UITableViewAutomaticDimension cells:cells];
}

+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle headerView:(UIView *)headerView headerHeight:(CGFloat)headerHeight footerTitle:(NSString *)footerTitle footerView:(UIView *)footerView footerHeight:(CGFloat)footerHeight cells:(NSArray *)cells {
    JDTableSection *section = [[self class] new];
    section.headerTitle = headerTitle;
    section.cells = [cells mutableCopy];
    return section;
}

- (instancetype)initSectionSupportingReuseWithTitle:(NSString *)title cellCount:(NSInteger)cellCount cellHeight:(CGFloat)cellHeight cellForRowBlock:(CellForRowBlock)cellForRowBlock actionBlock:(CellActionBlock)actionBlock {
    self = [[self class] sectionWithHeaderTitle:title cells:nil];
    
    _reuseEnabled = YES;
    _reusedCellCount = cellCount;
    _reusedCellHeight = cellHeight;
    _cellForRowBlock = cellForRowBlock;
    _reusedCellActionBlock = actionBlock;
    
    return self;
}


@end
