//
//  JDGistsListInteractor.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListInteractorInput.h"

@protocol JDGistsListInteractorOutput;
@protocol JDGistsService;
@protocol JDUsersService;

@interface JDGistsListInteractor : NSObject <JDGistsListInteractorInput>

@property (nonatomic, weak) id<JDGistsListInteractorOutput> output;

@property (nonatomic, strong) id <JDGistsService> gistsService;
@property (nonatomic, strong) id <JDUsersService> usersService;

@end
