//
//  JDUsersHeaderAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDUsersHeaderAssembly.h"

#import "JDUsersHeaderViewController.h"
#import "JDUsersHeaderInteractor.h"
#import "JDUsersHeaderPresenter.h"
#import "JDUsersHeaderRouter.h"

@implementation JDUsersHeaderAssembly

- (JDUsersHeaderViewController *)viewUsersHeader {
    return [TyphoonDefinition withClass:[JDUsersHeaderViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterUsersHeader]];
                          }];
}

- (JDUsersHeaderInteractor *)interactorUsersHeader {
    return [TyphoonDefinition withClass:[JDUsersHeaderInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterUsersHeader]];
                          }];
}

- (JDUsersHeaderPresenter *)presenterUsersHeader {
    return [TyphoonDefinition withClass:[JDUsersHeaderPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewUsersHeader]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorUsersHeader]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerUsersHeader]];
                          }];
}

- (JDUsersHeaderRouter *)routerUsersHeader{
    return [TyphoonDefinition withClass:[JDUsersHeaderRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewUsersHeader]];
                          }];
}

@end
