//
//  JDUsersHeaderRouter.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDUsersHeaderRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface JDUsersHeaderRouter : NSObject <JDUsersHeaderRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
