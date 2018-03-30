//
//  JDFilesDetailPresenter.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesDetailViewOutput.h"
#import "JDFilesDetailInteractorOutput.h"
#import "JDFilesDetailModuleInput.h"

@protocol JDFilesDetailViewInput;
@protocol JDFilesDetailInteractorInput;
@protocol JDFilesDetailRouterInput;

@interface JDFilesDetailPresenter : NSObject <JDFilesDetailModuleInput, JDFilesDetailViewOutput, JDFilesDetailInteractorOutput>

@property (nonatomic, weak) id<JDFilesDetailViewInput> view;
@property (nonatomic, strong) id<JDFilesDetailInteractorInput> interactor;
@property (nonatomic, strong) id<JDFilesDetailRouterInput> router;

@end
