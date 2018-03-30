//
//  JDFilesListRouter.m
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesListRouter.h"
#import "JDFilesDetailModuleFactory.h"
#import "JDFilesDetailModuleInput.h"
#import "JDFile.h"


@implementation JDFilesListRouter

#pragma mark - Методы JDFilesListRouterInput

- (void)openFileModuleWithFile:(JDFile *)file {
    id <JDFilesDetailModuleInput> presenter = self.factoryFilesDetail.presenterFilesDetail;
    [presenter configureModuleWithFileContent:file.content];
    [self.viewController.navigationController pushViewController:presenter.view animated:YES];
}

@end
