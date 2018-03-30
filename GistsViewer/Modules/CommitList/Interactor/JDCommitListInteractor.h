//
//  JDCommitListInteractor.h
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDCommitListInteractorInput.h"

@protocol JDCommitListInteractorOutput;

@interface JDCommitListInteractor : NSObject <JDCommitListInteractorInput>

@property (nonatomic, weak) id<JDCommitListInteractorOutput> output;

@end
