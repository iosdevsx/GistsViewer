//
//  JDCommitListPresenter.m
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDCommitListPresenter.h"
#import "JDCommitListViewInput.h"
#import "JDCommitListInteractorInput.h"
#import "JDCommitListRouterInput.h"


@interface JDCommitListPresenter()

@property (nonatomic, strong) NSArray *commits;

@end

@implementation JDCommitListPresenter

#pragma mark - Методы JDCommitListModuleInput

- (void)configureModuleWithCommits:(NSArray *)commits {
    self.commits = commits;
}

#pragma mark - Методы JDCommitListViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialStateWithCommits:self.commits];
}

#pragma mark - Методы JDCommitListInteractorOutput

@end
