//
//  PONSOConverterAssembly.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "PONSOConverter.h"

@interface PONSOConverterAssembly : TyphoonAssembly

- (id <PONSOConverter>)ponsoConverterService;

@end
