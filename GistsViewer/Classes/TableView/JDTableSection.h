//
//  JDTableSection.h
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class JDTableCell;

@interface JDTableSection : NSObject

typedef UITableViewCell * (^CellForRowBlock)(UITableView *tableView, NSInteger row);
typedef NSArray * (^EditActionForRowBlock)(UITableView *tableView, NSInteger row);
typedef void (^CellActionBlock)(NSInteger row);

@property (nonatomic, strong) NSMutableArray *cells;
@property (nonatomic, strong) NSArray *editActions;

@property (nonatomic, strong) NSString *headerTitle;

@property (nonatomic, readonly) BOOL reuseEnabled;
@property (nonatomic) NSInteger reusedCellCount;
@property (nonatomic, readonly) CGFloat reusedCellHeight;
@property (nonatomic, copy, readonly) CellForRowBlock cellForRowBlock;
@property (nonatomic, copy, readonly) CellActionBlock reusedCellActionBlock;
@property (nonatomic, copy) EditActionForRowBlock reusedEditActionsBlock;

+ (instancetype)sectionWithCells:(NSArray *)cells;

+ (instancetype)sectionSupportingReuseWithTitle:(NSString *)title
                                      cellCount:(NSInteger)cellCount
                                     cellHeight:(CGFloat)cellHeight
                                cellForRowBlock:(CellForRowBlock)cellForRowBlock
                                    actionBlock:(CellActionBlock)actionBlock;


@end
