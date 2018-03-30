//
//  JDGistsServiceAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDGistsServiceAssembly.h"
#import "JDGistsService.h"
#import "JDGistsServiceImplementation.h"
#import "APIAssembly.h"
#import "API.h"
#import "JDCoreDataServiceAssembly.h"
#import "JDResponseConverterAssembly.h"


@interface JDGistsServiceAssembly()

@property (nonatomic, strong) APIAssembly *apiAssembly;
@property (nonatomic, strong) JDCoreDataServiceAssembly *coreDataAssembly;
@property (nonatomic, strong) JDResponseConverterAssembly *responseConverterAssembly;

@end

@implementation JDGistsServiceAssembly

- (id<JDGistsService>)gistsService {
    return [TyphoonDefinition withClass:[JDGistsServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(api) with:self.apiAssembly.apiService];
        [definition injectProperty:@selector(coreDataService) with:self.coreDataAssembly.coreDataService];
        [definition injectProperty:@selector(responseConverter) with:self.responseConverterAssembly.responseConverter];
    }];
}

@end
