//
//  JDUsersServiceAssembly.m
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDUsersServiceAssembly.h"
#import "JDUsersServiceImplementation.h"
#import "APIAssembly.h"
#import "JDCoreDataServiceAssembly.h"
#import "JDResponseConverterAssembly.h"


@interface JDUsersServiceAssembly()

@property (nonatomic, strong) APIAssembly *apiAssembly;
@property (nonatomic, strong) JDCoreDataServiceAssembly *coreDataAssembly;
@property (nonatomic, strong) JDResponseConverterAssembly *responseConverterAssembly;

@end

@implementation JDUsersServiceAssembly

- (id <JDUsersService>)usersService {
    return [TyphoonDefinition withClass:[JDUsersServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(api) with:self.apiAssembly.apiService];
        [definition injectProperty:@selector(coreDataService) with:self.coreDataAssembly.coreDataService];
        [definition injectProperty:@selector(responseConverter) with:self.responseConverterAssembly.responseConverter];
    }];
}

@end
