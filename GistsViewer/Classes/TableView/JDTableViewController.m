//
//  JDTableViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDTableViewController.h"
#import "JDTableSection.h"
#import "JDTableCell.h"


@interface JDTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) JDTableView *tableView;

@end

@implementation JDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self jd_setupTableView];
}

- (void)jd_setupTableView {
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedRowHeight = 70.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (JDTableView *)tableView {
    if (!_tableView) {
        _tableView = [JDTableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)setSections:(NSArray *)sections {
    _sections = sections;
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    JDTableSection *currentSection = self.sections[section];
    return currentSection.headerTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDTableSection *currentSection = self.sections[indexPath.section];
    
    if (currentSection.reuseEnabled) {
        return currentSection.reusedCellHeight;
    }
    
    else {
        JDTableCell *cell = currentSection.cells[indexPath.row];
        return cell.height;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JDTableSection *currentSection = self.sections[section];
    return currentSection.reuseEnabled ? currentSection.reusedCellCount : currentSection.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDTableSection *currentSection = self.sections[indexPath.section];
    
    if (currentSection.reuseEnabled) {
        return currentSection.cellForRowBlock(tableView, indexPath.row);
    }
    
    else {
        return currentSection.cells[indexPath.row];
    }
}

#pragma mark - UITableViewDelegate

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDTableSection *currentSection = self.sections[indexPath.section];
    if (currentSection.reuseEnabled) {
        if (currentSection.reusedEditActionsBlock) {
            return currentSection.reusedEditActionsBlock(tableView, indexPath.row);
        }
    } else {
        if (currentSection.editActions) {
            return currentSection.editActions;
        }
    }
    
    return @[];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JDTableSection *currentSection = self.sections[indexPath.section];
    
    if (currentSection.reuseEnabled) {
        if (currentSection.reusedCellActionBlock) {
            currentSection.reusedCellActionBlock(indexPath.row);
        }
    }
    
    else {
        JDTableCell *cell = currentSection.cells[indexPath.row];
        
        if (cell.actionBlock) {
            cell.actionBlock();
        }
    }
}

@end
