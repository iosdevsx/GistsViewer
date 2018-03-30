//
//  JDGistDetailViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailViewController.h"
#import "JDGistDetailViewOutput.h"
#import "JDGist.h"
#import "JDOwner.h"
#import "JDFile.h"
#import "JDGistDetailHeaderView.h"
#import "JDGistDetailCell.h"
#import "JDTableSection.h"


@interface JDGistDetailViewController()

@property (nonatomic, strong) JDGistDetailHeaderView *headerView;

@property (nonatomic, strong) JDGistDetailCell *filesCell;
@property (nonatomic, strong) JDGistDetailCell *commentsCell;
@property (nonatomic, strong) JDGistDetailCell *commitsCell;
@property (nonatomic, strong) JDGistDetailCell *forksCell;
@property (nonatomic, strong) JDGistDetailCell *ownerCell;

@end

@implementation JDGistDetailViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDGistDetailViewInput

- (void)setupInitialStateWithGist:(JDGist *)gist {
    [self.headerView setupWitGist:gist];
    [self.tableView addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(@200);
    }];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200.f)];
    self.tableView.tableHeaderView = view;
    
    [self configureCellsForGist:gist];
}

- (void)configureCellsForGist:(JDGist *)gist {
    [self.ownerCell updateRightText:[NSString stringWithFormat:@"%@", gist.owner.login]];
    
    self.sections = @[[JDTableSection sectionWithCells:@[self.ownerCell,
                                                       self.commitsCell,
//                                                       self.forksCell,
                                                       self.filesCell]]];
}

- (void)updateCommitsCount:(NSInteger)count {
    [self.commitsCell updateRightText:[NSString stringWithFormat:@"%ld", (unsigned long)count]];
}

- (void)updateFilesCount:(NSInteger)count {
    [self.filesCell updateRightText:[NSString stringWithFormat:@"%lu", (unsigned long)count]];
}

- (void)showError:(NSString *)error {
    [self jd_showErrorMessage:error];
}

#pragma mark - Lazy properties

- (JDGistDetailHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [JDGistDetailHeaderView view];
    }
    return _headerView;
}

- (JDGistDetailCell *)filesCell {
    if (!_filesCell) {
        _filesCell = [JDGistDetailCell cellWithType:DetailTypeFiles leftText:@"Files" rightText:@""];
        
        __weak typeof(self) wself = self;
        _filesCell.actionBlock = ^{
            [wself.output handleCellTapForType:DetailTypeFiles];
        };
    }
    return _filesCell;
}

- (JDGistDetailCell *)commitsCell {
    if (!_commitsCell) {
        _commitsCell = [JDGistDetailCell cellWithType:DetailTypeCommits leftText:@"Commits" rightText:@""];
        
        __weak typeof(self) wself = self;
        _commitsCell.actionBlock = ^{
            [wself.output handleCellTapForType:DetailTypeCommits];
        };
    }
    return _commitsCell;
}

- (JDGistDetailCell *)ownerCell {
    if (!_ownerCell) {
        _ownerCell = [JDGistDetailCell cellWithType:DetailTypeOwner leftText:@"Owner" rightText:@""];
        
        __weak typeof(self) wself = self;
        _ownerCell.actionBlock = ^{
            [wself.output handleCellTapForType:DetailTypeOwner];
        };
    }
    return _ownerCell;
}

- (JDGistDetailCell *)forksCell {
    if (!_forksCell) {
        _forksCell = [JDGistDetailCell cellWithType:DetailTypeForks leftText:@"Forks" rightText:@""];
        
        __weak typeof(self) wself = self;
        _forksCell.actionBlock = ^{
            [wself.output handleCellTapForType:DetailTypeForks];
        };
    }
    return _forksCell;
}

@end
