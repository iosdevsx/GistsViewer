//
//  JDGistDetailPresenter.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailViewOutput.h"
#import "JDGistDetailInteractorOutput.h"
#import "JDGistDetailModuleInput.h"

@protocol JDGistDetailViewInput;
@protocol JDGistDetailInteractorInput;
@protocol JDGistDetailRouterInput;

@interface JDGistDetailPresenter : NSObject <JDGistDetailModuleInput, JDGistDetailViewOutput, JDGistDetailInteractorOutput>

@property (nonatomic, weak) id<JDGistDetailViewInput> view;
@property (nonatomic, strong) id<JDGistDetailInteractorInput> interactor;
@property (nonatomic, strong) id<JDGistDetailRouterInput> router;

@end
