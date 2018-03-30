//
//  JDResponseConverterAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDResponseConverterAssembly.h"
#import "JDResponseConverterImplementation.h"

@implementation JDResponseConverterAssembly

- (id <JDResponseConverter>)responseConverter {
    return [TyphoonDefinition withClass:[JDResponseConverterImplementation class]];
}

@end
