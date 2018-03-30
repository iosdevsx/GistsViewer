//
//  JDGistsListRouter.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListRouter.h"
#import "JDGist.h"
#import "JDGistDetailModuleInput.h"
#import "JDGistDetailModuleFactory.h"

@implementation JDGistsListRouter

#pragma mark - Методы JDGistsListRouterInput

- (void)openGistDetailModuleWithGist:(JDGist *)gist {
    id <JDGistDetailModuleInput> presenter = self.factoryGistDetail.presenterGistDetail;
    [presenter configureModuleWithGist:gist];
    [self.viewController.navigationController pushViewController:presenter.view animated:YES];
}

@end
