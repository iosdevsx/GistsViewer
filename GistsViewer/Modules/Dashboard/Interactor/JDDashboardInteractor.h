//
//  JDDashboardInteractor.h
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDDashboardInteractorInput.h"

@protocol JDDashboardInteractorOutput;
@protocol JDUsersService;

@interface JDDashboardInteractor : NSObject <JDDashboardInteractorInput>

@property (nonatomic, weak) id <JDDashboardInteractorOutput> output;
@property (nonatomic, strong) id <JDUsersService> userService;

@end
