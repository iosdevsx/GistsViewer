//
//  JDGistDetailAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailAssembly.h"
#import "JDGistDetailViewController.h"
#import "JDGistDetailInteractor.h"
#import "JDGistDetailPresenter.h"
#import "JDGistDetailRouter.h"
#import "JDGistsServiceAssembly.h"
#import "JDCommitListAssembly.h"
#import "JDFilesListAssembly.h"


@interface JDGistDetailAssembly()

@property (nonatomic, strong) JDGistsServiceAssembly *gistsServiceAssembly;
@property (nonatomic, strong) JDCommitListAssembly *commitListAssembly;
@property (nonatomic, strong) JDFilesListAssembly *filesListAssembly;

@end


@implementation JDGistDetailAssembly

- (JDGistDetailViewController *)viewGistDetail {
    return [TyphoonDefinition withClass:[JDGistDetailViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterGistDetail]];
                          }];
}

- (JDGistDetailInteractor *)interactorGistDetail {
    return [TyphoonDefinition withClass:[JDGistDetailInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterGistDetail]];
                              [definition injectProperty:@selector(gistsService)
                                                    with:self.gistsServiceAssembly.gistsService];
                          }];
}

- (JDGistDetailPresenter *)presenterGistDetail {
    return [TyphoonDefinition withClass:[JDGistDetailPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewGistDetail]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorGistDetail]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerGistDetail]];
                          }];
}

- (JDGistDetailRouter *)routerGistDetail{
    return [TyphoonDefinition withClass:[JDGistDetailRouter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(viewController)
                              with:[self viewGistDetail]];
        [definition injectProperty:@selector(factoryCommitList)
                              with:self.commitListAssembly];
        [definition injectProperty:@selector(factoryFilesList)
                              with:self.filesListAssembly];
    }];
}

@end
