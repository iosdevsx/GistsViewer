//
//  JDFilesListAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesListAssembly.h"
#import "JDFilesListViewController.h"
#import "JDFilesListInteractor.h"
#import "JDFilesListPresenter.h"
#import "JDFilesListRouter.h"
#import "JDFilesDetailAssembly.h"


@interface JDFilesListAssembly()

@property (nonatomic, strong) JDFilesDetailAssembly *filesDetailAssembly;

@end

@implementation JDFilesListAssembly

- (JDFilesListViewController *)viewFilesList {
    return [TyphoonDefinition withClass:[JDFilesListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilesList]];
                          }];
}

- (JDFilesListInteractor *)interactorFilesList {
    return [TyphoonDefinition withClass:[JDFilesListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilesList]];
                          }];
}

- (JDFilesListPresenter *)presenterFilesList {
    return [TyphoonDefinition withClass:[JDFilesListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFilesList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorFilesList]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFilesList]];
                          }];
}

- (JDFilesListRouter *)routerFilesList{
    return [TyphoonDefinition withClass:[JDFilesListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(factoryFilesDetail)
                                                    with:self.filesDetailAssembly];
                              [definition injectProperty:@selector(viewController)
                                                    with:[self viewFilesList]];
                          }];
}

@end
