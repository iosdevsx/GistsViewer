//
//  JDFilesDetailPresenter.m
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesDetailPresenter.h"

#import "JDFilesDetailViewInput.h"
#import "JDFilesDetailInteractorInput.h"
#import "JDFilesDetailRouterInput.h"


@interface JDFilesDetailPresenter()

@property (nonatomic, strong) NSString *content;

@end

@implementation JDFilesDetailPresenter

#pragma mark - Методы JDFilesDetailModuleInput

- (void)configureModuleWithFileContent:(NSString *)content {
    self.content = content;
}

#pragma mark - Методы JDFilesDetailViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialStateWithContent:self.content];
}

#pragma mark - Методы JDFilesDetailInteractorOutput

@end
