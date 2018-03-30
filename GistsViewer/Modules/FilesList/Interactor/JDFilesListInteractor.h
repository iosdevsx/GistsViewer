//
//  JDFilesListInteractor.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDFilesListInteractorInput.h"

@protocol JDFilesListInteractorOutput;

@interface JDFilesListInteractor : NSObject <JDFilesListInteractorInput>

@property (nonatomic, weak) id<JDFilesListInteractorOutput> output;

@end
