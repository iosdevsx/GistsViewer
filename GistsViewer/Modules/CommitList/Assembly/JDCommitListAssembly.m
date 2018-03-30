//
//  JDCommitListAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDCommitListAssembly.h"
#import "JDCommitListViewController.h"
#import "JDCommitListInteractor.h"
#import "JDCommitListPresenter.h"
#import "JDCommitListRouter.h"


@implementation JDCommitListAssembly

- (JDCommitListViewController *)viewCommitList {
    return [TyphoonDefinition withClass:[JDCommitListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterCommitList]];
                          }];
}

- (JDCommitListInteractor *)interactorCommitList {
    return [TyphoonDefinition withClass:[JDCommitListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterCommitList]];
                          }];
}

- (JDCommitListPresenter *)presenterCommitList{
    return [TyphoonDefinition withClass:[JDCommitListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewCommitList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorCommitList]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerCommitList]];
                          }];
}

- (JDCommitListRouter *)routerCommitList{
    return [TyphoonDefinition withClass:[JDCommitListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewCommitList]];
                          }];
}

@end
