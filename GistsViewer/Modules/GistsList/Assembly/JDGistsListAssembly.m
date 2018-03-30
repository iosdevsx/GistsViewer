//
//  JDGistsListAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListAssembly.h"
#import "JDGistsListViewController.h"
#import "JDGistsListInteractor.h"
#import "JDGistsListPresenter.h"
#import "JDGistsListRouter.h"
#import "JDGistsServiceAssembly.h"
#import "JDUsersServiceAssembly.h"
#import "JDGistDetailAssembly.h"


@interface JDGistsListAssembly()

@property (nonatomic, strong) JDGistsServiceAssembly *gistsServiceAssembly;
@property (nonatomic, strong) JDUsersServiceAssembly *usersServiceAssembly;
@property (nonatomic, strong) JDGistDetailAssembly *gistDetailAssembly;

@end

@implementation JDGistsListAssembly

- (JDGistsListViewController *)viewGistsList {
    return [TyphoonDefinition withClass:[JDGistsListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterGistsList]];
                          }];
}

- (JDGistsListInteractor *)interactorGistsList {
    return [TyphoonDefinition withClass:[JDGistsListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterGistsList]];
                              [definition injectProperty:@selector(gistsService)
                                                    with:self.gistsServiceAssembly.gistsService];
                              [definition injectProperty:@selector(usersService)
                                                    with:self.usersServiceAssembly.usersService];
                          }];
}

- (JDGistsListPresenter *)presenterGistsList {
    return [TyphoonDefinition withClass:[JDGistsListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewGistsList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorGistsList]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerGistsList]];
                          }];
}

- (JDGistsListRouter *)routerGistsList{
    return [TyphoonDefinition withClass:[JDGistsListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(viewController)
                                                    with:[self viewGistsList]];
                              [definition injectProperty:@selector(factoryGistDetail)
                                                    with:self.gistDetailAssembly]; 
                          }];
}

@end
