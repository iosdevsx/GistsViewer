//
//  PONSOConverterAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "PONSOConverterAssembly.h"
#import "PONSOConverterImplementation.h"

@implementation PONSOConverterAssembly

- (id <PONSOConverter>)ponsoConverterService {
    return [TyphoonDefinition withClass:[PONSOConverterImplementation class]];
}

@end
