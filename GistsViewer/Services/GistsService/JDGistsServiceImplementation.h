//
//  JDGistsServiceImplementation.h
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "JDGistsService.h"

@protocol API;
@protocol JDResponseConverter;
@protocol JDCoreDataService;

@interface JDGistsServiceImplementation : NSObject <JDGistsService>

@property (nonatomic, strong) id <API> api;
@property (nonatomic, strong) id <JDResponseConverter> responseConverter;
@property (nonatomic, strong) id <JDCoreDataService> coreDataService;

@end
