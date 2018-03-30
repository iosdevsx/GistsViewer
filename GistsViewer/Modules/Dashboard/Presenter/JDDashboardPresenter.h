//
//  JDDashboardPresenter.h
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardViewOutput.h"
#import "JDDashboardInteractorOutput.h"
#import "JDDashboardModuleInput.h"

@protocol JDDashboardViewInput;
@protocol JDDashboardInteractorInput;
@protocol JDDashboardRouterInput;

@interface JDDashboardPresenter : NSObject <JDDashboardModuleInput, JDDashboardViewOutput, JDDashboardInteractorOutput>

@property (nonatomic, strong) id<JDDashboardViewInput> view;
@property (nonatomic, strong) id<JDDashboardInteractorInput> interactor;
@property (nonatomic, strong) id<JDDashboardRouterInput> router;

@end
