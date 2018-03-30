//
//  JDFilesListPresenter.m
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesListPresenter.h"
#import "JDFilesListViewInput.h"
#import "JDFilesListInteractorInput.h"
#import "JDFilesListRouterInput.h"


@interface JDFilesListPresenter()

@property (nonatomic, strong) NSArray *files;

@end

@implementation JDFilesListPresenter

#pragma mark - Методы JDFilesListModuleInput

- (void)configureModuleWithFiles:(NSArray *)files {
    self.files = files;
}

#pragma mark - Методы JDFilesListViewOutput

- (void)didTriggerViewReadyEvent {
    [self.view setupInitialStateWithFiles:self.files];
}

- (void)handleFileTapAtIndex:(NSInteger)index {
    [self.router openFileModuleWithFile:self.files[index]];
}

#pragma mark - Методы JDFilesListInteractorOutput

@end
