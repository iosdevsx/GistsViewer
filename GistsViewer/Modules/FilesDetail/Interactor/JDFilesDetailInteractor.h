//
//  JDFilesDetailInteractor.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesDetailInteractorInput.h"

@protocol JDFilesDetailInteractorOutput;

@interface JDFilesDetailInteractor : NSObject <JDFilesDetailInteractorInput>

@property (nonatomic, weak) id<JDFilesDetailInteractorOutput> output;

@end
