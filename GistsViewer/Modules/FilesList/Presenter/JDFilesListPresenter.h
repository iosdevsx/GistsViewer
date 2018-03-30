//
//  JDFilesListPresenter.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesListViewOutput.h"
#import "JDFilesListInteractorOutput.h"
#import "JDFilesListModuleInput.h"

@protocol JDFilesListViewInput;
@protocol JDFilesListInteractorInput;
@protocol JDFilesListRouterInput;

@interface JDFilesListPresenter : NSObject <JDFilesListModuleInput, JDFilesListViewOutput, JDFilesListInteractorOutput>

@property (nonatomic, weak) id<JDFilesListViewInput> view;
@property (nonatomic, strong) id<JDFilesListInteractorInput> interactor;
@property (nonatomic, strong) id<JDFilesListRouterInput> router;

@end
