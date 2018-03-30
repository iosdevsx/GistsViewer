//
//  JDUsersHeaderPresenter.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDUsersHeaderViewOutput.h"
#import "JDUsersHeaderInteractorOutput.h"
#import "JDUsersHeaderModuleInput.h"

@protocol JDUsersHeaderViewInput;
@protocol JDUsersHeaderInteractorInput;
@protocol JDUsersHeaderRouterInput;

@interface JDUsersHeaderPresenter : NSObject <JDUsersHeaderModuleInput, JDUsersHeaderViewOutput, JDUsersHeaderInteractorOutput>

@property (nonatomic, strong) id<JDUsersHeaderViewInput> view;
@property (nonatomic, strong) id<JDUsersHeaderInteractorInput> interactor;
@property (nonatomic, strong) id<JDUsersHeaderRouterInput> router;

@end
