//
//  JDCommitListPresenter.h
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDCommitListViewOutput.h"
#import "JDCommitListInteractorOutput.h"
#import "JDCommitListModuleInput.h"

@protocol JDCommitListViewInput;
@protocol JDCommitListInteractorInput;
@protocol JDCommitListRouterInput;

@interface JDCommitListPresenter : NSObject <JDCommitListModuleInput, JDCommitListViewOutput, JDCommitListInteractorOutput>

@property (nonatomic, weak) id<JDCommitListViewInput> view;
@property (nonatomic, strong) id<JDCommitListInteractorInput> interactor;
@property (nonatomic, strong) id<JDCommitListRouterInput> router;

@end
