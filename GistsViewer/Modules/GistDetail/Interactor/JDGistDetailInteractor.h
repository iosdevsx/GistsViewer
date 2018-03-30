//
//  JDGistDetailInteractor.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistDetailInteractorInput.h"

@protocol JDGistDetailInteractorOutput;
@protocol JDGistsService;

@interface JDGistDetailInteractor : NSObject <JDGistDetailInteractorInput>

@property (nonatomic, weak) id<JDGistDetailInteractorOutput> output;
@property (nonatomic, strong) id <JDGistsService> gistsService;

@end
