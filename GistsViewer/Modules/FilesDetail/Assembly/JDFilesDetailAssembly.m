//
//  JDFilesDetailAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesDetailAssembly.h"
#import "JDFilesDetailViewController.h"
#import "JDFilesDetailInteractor.h"
#import "JDFilesDetailPresenter.h"
#import "JDFilesDetailRouter.h"
#import "JDFilesDetailAssembly.h"


@implementation JDFilesDetailAssembly

- (JDFilesDetailViewController *)viewFilesDetail {
    return [TyphoonDefinition withClass:[JDFilesDetailViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilesDetail]];
                          }];
}

- (JDFilesDetailInteractor *)interactorFilesDetail {
    return [TyphoonDefinition withClass:[JDFilesDetailInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilesDetail]];
                          }];
}

- (JDFilesDetailPresenter *)presenterFilesDetail {
    return [TyphoonDefinition withClass:[JDFilesDetailPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFilesDetail]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorFilesDetail]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFilesDetail]];
                          }];
}

- (JDFilesDetailRouter *)routerFilesDetail{
    return [TyphoonDefinition withClass:[JDFilesDetailRouter class]];
}

@end
