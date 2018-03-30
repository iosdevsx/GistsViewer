//
//  JDGistsListViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListViewController.h"
#import "JDGistsListViewOutput.h"
#import "JDGistCell.h"
#import "JDGist.h"
#import "JDTableSection.h"
#import "JDRetryStubView.h"


@interface JDGistsListViewController()

@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) JDRetryStubView *stubView;

@end

@implementation JDGistsListViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDGistsListViewInput

- (void)setupInitialState {
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(updateFired) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDGistCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([JDGistCell class])];
}

- (void)updateViewWithGists:(NSArray *)gists {
    [self.refreshControl endRefreshing];
    
    JDTableSection *reuseSection = [JDTableSection sectionSupportingReuseWithTitle:nil cellCount:gists.count cellHeight:UITableViewAutomaticDimension cellForRowBlock:^UITableViewCell *(UITableView *tableView, NSInteger row) {
        
        JDGistCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JDGistCell class])];
        [cell setupWithGist:gists[row]];
        
        return cell;
    } actionBlock:^(NSInteger row) {
        JDGist *gist = gists[row];
        [self.output handleGistSelected:gist];
    }];
    
    self.sections = @[reuseSection];
}

- (void)showLoader {
    [self jd_showLoader];
}

- (void)hideLoader {
    [self jd_hideLoader];
}

- (void)showError:(NSString *)error {
    [self jd_showErrorMessage:error];
}

- (void)showStubViewWithError:(NSString *)error {
    __weak typeof(self) wself = self;
    self.stubView = [self jd_showStubViewWithMessage:error actionBlock:^{
        [wself.output handleRetryTap];
    }];
}

- (void)hideStubView {
    [self.stubView removeFromSuperview];
    self.stubView = nil;
}

#pragma mark - Actions

- (void)updateFired {
    [self.output handleUpdateGistsFired];
}
@end
