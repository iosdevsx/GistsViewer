//
//  JDUsersServiceImplementation.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDUsersService.h"

@protocol API;
@protocol PONSOConverter;
@protocol JDCoreDataService;
@protocol JDResponseConverter;

@interface JDUsersServiceImplementation : NSObject <JDUsersService>

@property (nonatomic, strong) id <API> api;
@property (nonatomic, strong) id <PONSOConverter> ponsoConverter;
@property (nonatomic, strong) id <JDCoreDataService> coreDataService;
@property (nonatomic, strong) id <JDResponseConverter> responseConverter;

@end
