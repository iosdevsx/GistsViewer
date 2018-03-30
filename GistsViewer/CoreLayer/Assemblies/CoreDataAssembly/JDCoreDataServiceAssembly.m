//
//  JDCoreDataServiceAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDCoreDataServiceAssembly.h"
#import "JDCoreDataServiceImplementation.h"
#import "PONSOConverterAssembly.h"


@interface JDCoreDataServiceAssembly()

@property (nonatomic, strong) PONSOConverterAssembly *ponsoConverterAssembly;

@end

@implementation JDCoreDataServiceAssembly

- (id <JDCoreDataService>)coreDataService {
    return [TyphoonDefinition withClass:[JDCoreDataServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(ponsoConverter) with:self.ponsoConverterAssembly.ponsoConverterService];
    }];
}

@end
