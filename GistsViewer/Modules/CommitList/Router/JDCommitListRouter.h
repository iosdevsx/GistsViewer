//
//  JDCommitListRouter.h
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDCommitListRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface JDCommitListRouter : NSObject <JDCommitListRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
