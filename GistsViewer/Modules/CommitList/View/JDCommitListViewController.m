//
//  JDCommitListViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDCommitListViewController.h"
#import "JDCommitListViewOutput.h"
#import "JDTableSection.h"
#import "JDCommitCell.h"
#import "JDTableView+Utils.h"

@implementation JDCommitListViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    [self.tableView jd_registerNib:[JDCommitCell class]];
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDCommitListViewInput

- (void)setupInitialStateWithCommits:(NSArray *)commits {
    JDTableSection *section = [JDTableSection sectionSupportingReuseWithTitle:nil cellCount:commits.count cellHeight:UITableViewAutomaticDimension cellForRowBlock:^UITableViewCell *(UITableView *tableView, NSInteger row) {
        JDCommitCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JDCommitCell class])];
        [cell setupWithCommit:commits[row]];
        return cell;
    } actionBlock:nil];
    
    self.sections = @[section];
}

@end
