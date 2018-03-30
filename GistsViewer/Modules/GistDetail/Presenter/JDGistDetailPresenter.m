//
//  JDGistDetailPresenter.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailPresenter.h"
#import "JDGistDetailViewInput.h"
#import "JDGistDetailInteractorInput.h"
#import "JDGistDetailRouterInput.h"
#import "Enums.h"


@interface JDGistDetailPresenter()

@property (nonatomic, strong) JDGist *gist;
@property (nonatomic, strong) NSArray *commits;
@property (nonatomic, strong) NSArray *files;

@end

@implementation JDGistDetailPresenter

#pragma mark - Методы JDGistDetailModuleInput

- (void)configureModuleWithGist:(JDGist *)gist {
    self.gist = gist;
}

#pragma mark - Методы JDGistDetailViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialStateWithGist:self.gist];
    [self.interactor fetchCommitsForGist:self.gist];
    [self.interactor fetchFilesForGist:self.gist];
}

- (void)handleCellTapForType:(DetailType)type {
    switch (type) {
        case DetailTypeFiles:
            if (self.files.count > 0) {
                [self.router openFilesModuleWithFiles:self.files];
            }
        break;
        case DetailTypeForks: NSLog(@"forks"); break;
        case DetailTypeOwner: NSLog(@"owner"); break;
        case DetailTypeCommits:
            if (self.commits.count > 0) {
                [self.router openCommitsModuleWithCommits:self.commits];
            }
        break;
        case DetailTypeComments: NSLog(@"comments"); break;
    }
}

#pragma mark - Методы JDGistDetailInteractorOutput

- (void)commitsFetched:(NSArray *)commits {
    self.commits = commits;
    [self.view updateCommitsCount:commits.count];
}

- (void)commitsFetchFailed:(NSString *)error {
    [self.view showError:error];
}

- (void)filesFetched:(NSArray *)files {
    self.files = files;
    [self.view updateFilesCount:files.count];
}

- (void)filesFetchFailed:(NSString *)error {
    [self.view showError:error];
}

@end
