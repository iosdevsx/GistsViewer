//
//  JDDashboardViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardViewController.h"
#import "JDDashboardViewOutput.h"
#import "JDGist.h"
#import "JDFile.h"
#import "JDGistCell.h"
#import "JDTableSection.h"
#import "JDTableViewController.h"


@interface JDDashboardViewController()

@property (nonatomic, weak) JDTableViewController *gistsTableController;

@end

@implementation JDDashboardViewController

#pragma mark - Методы жизненного цикла

- (UIViewController *)toPresent {
    return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDDashboardViewInput

- (void)setupInitialStateWithGistsList:(UIViewController *)gistsListController {
    self.title = @"Gists List";
    [gistsListController willMoveToParentViewController:self];
    [self addChildViewController:gistsListController];
    [self.view addSubview:gistsListController.view];
    gistsListController.view.frame = self.view.frame;
    [gistsListController didMoveToParentViewController:self];
    
    self.gistsTableController = (JDTableViewController *)gistsListController;
}

- (void)addUsersHeader:(UIViewController *)usersHeaderController {
    [usersHeaderController willMoveToParentViewController:self];
    
    self.gistsTableController.tableView.tableHeaderView = usersHeaderController.view;
    [usersHeaderController didMoveToParentViewController:self];
    
    [usersHeaderController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(@80);
    }];
    
    [self.view layoutIfNeeded];
}


@end
