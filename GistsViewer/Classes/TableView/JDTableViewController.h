//
//  JDTableViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDTableView.h"

@class JDTableSection;

@interface JDTableViewController : UIViewController

@property (nonatomic, strong, readonly) JDTableView *tableView;
@property (nonatomic, strong) NSArray <JDTableSection *> *sections;

@end
