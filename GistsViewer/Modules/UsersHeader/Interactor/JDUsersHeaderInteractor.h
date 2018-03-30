//
//  JDUsersHeaderInteractor.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDUsersHeaderInteractorInput.h"

@protocol JDUsersHeaderInteractorOutput;

@interface JDUsersHeaderInteractor : NSObject <JDUsersHeaderInteractorInput>

@property (nonatomic, weak) id<JDUsersHeaderInteractorOutput> output;

@end
