//
//  JDFilesListViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesListViewController.h"
#import "JDTableView+Utils.h"
#import "JDTableSection.h"
#import "JDFileCell.h"
#import "JDFilesListViewOutput.h"

@implementation JDFilesListViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    [self.tableView jd_registerNib:[JDFileCell class]];
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDFilesListViewInput

- (void)setupInitialStateWithFiles:(NSArray *)files {
    __weak typeof(self) wself = self;
    JDTableSection *section = [JDTableSection sectionSupportingReuseWithTitle:nil cellCount:files.count cellHeight:UITableViewAutomaticDimension cellForRowBlock:^UITableViewCell *(UITableView *tableView, NSInteger row) {
        JDFileCell *file = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JDFileCell class])];
        [file setupWithFile:files[row]];
        return file;
    } actionBlock:^(NSInteger row) {
        [wself.output handleFileTapAtIndex:row];
    }];
    
    self.sections = @[section];
}

@end
