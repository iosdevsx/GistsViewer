//
//  JDGistDetailRouter.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailRouter.h"
#import "JDCommitListModuleFactory.h"
#import "JDCommitListModuleInput.h"
#import "JDFilesListModuleInput.h"
#import "JDFilesListModuleFactory.h"


@implementation JDGistDetailRouter

#pragma mark - Методы JDGistDetailRouterInput

- (void)openFilesModuleWithFiles:(NSArray *)files {
    id <JDFilesListModuleInput> presenter = self.factoryFilesList.presenterFilesList;
    [presenter configureModuleWithFiles:files];
    [self.viewController.navigationController pushViewController:presenter.view animated:YES];
}

- (void)openCommitsModuleWithCommits:(NSArray *)commits {
    id <JDCommitListModuleInput> presenter = self.factoryCommitList.presenterCommitList;
    [presenter configureModuleWithCommits:commits];
    [self.viewController.navigationController pushViewController:presenter.view animated:YES];
}

@end
