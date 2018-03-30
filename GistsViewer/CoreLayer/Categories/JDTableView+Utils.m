//
//  JDTableView+Utils.m
//  GistsViewer
//
//  Created by Юрий Логинов on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDTableView+Utils.h"

@implementation JDTableView (Utils)

- (void)jd_registerNib:(Class)nibClass {
     [self registerNib:[UINib nibWithNibName:NSStringFromClass([nibClass class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([nibClass class])];
}

@end
