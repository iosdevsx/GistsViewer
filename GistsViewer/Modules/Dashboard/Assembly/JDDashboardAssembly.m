//
//  JDDashboardAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardAssembly.h"
#import "JDDashboardViewController.h"
#import "JDDashboardInteractor.h"
#import "JDDashboardPresenter.h"
#import "JDDashboardRouter.h"
#import "JDGistsServiceAssembly.h"
#import "JDGistsListAssembly.h"
#import "JDUsersHeaderAssembly.h"
#import "JDUsersServiceAssembly.h"
#import "JDGistDetailAssembly.h"

@interface JDDashboardAssembly()

@property (nonatomic, strong) JDGistsListAssembly *gistsListAssembly;
@property (nonatomic, strong) JDUsersHeaderAssembly *usersHeaderAssembly;
@property (nonatomic, strong) JDUsersServiceAssembly *usersServiceAssembly;

@end

@implementation JDDashboardAssembly

- (JDDashboardViewController *)viewDashboard {
    return [TyphoonDefinition withClass:[JDDashboardViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterDashboard]];
                          }];
}

- (JDDashboardInteractor *)interactorDashboard {
    return [TyphoonDefinition withClass:[JDDashboardInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterDashboard]];
                              [definition injectProperty:@selector(userService)
                                                    with:self.usersServiceAssembly.usersService];
                          }];
}

- (id <JDDashboardModuleInput>)presenterDashboard {
    return [TyphoonDefinition withClass:[JDDashboardPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewDashboard]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorDashboard]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerDashboard]];
                          }];
}

- (JDDashboardRouter *)routerDashboard{
    return [TyphoonDefinition withClass:[JDDashboardRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(factoryGistsList)
                                                    with:self.gistsListAssembly];
                              [definition injectProperty:@selector(factoryUsersList)
                                                    with:self.usersHeaderAssembly];
                              [definition injectProperty:@selector(viewController)
                                                    with:[self viewDashboard]];
                          }];
}

@end
