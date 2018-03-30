//
//  JDGistsListPresenter.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListViewOutput.h"
#import "JDGistsListInteractorOutput.h"
#import "JDGistsListModuleInput.h"

@protocol JDGistsListViewInput;
@protocol JDGistsListInteractorInput;
@protocol JDGistsListRouterInput;

@interface JDGistsListPresenter : NSObject <JDGistsListModuleInput, JDGistsListViewOutput, JDGistsListInteractorOutput>

@property (nonatomic, strong) id<JDGistsListViewInput> view;
@property (nonatomic, strong) id<JDGistsListInteractorInput> interactor;
@property (nonatomic, strong) id<JDGistsListRouterInput> router;

@end
