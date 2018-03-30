//
//  JDResponseConverterAssembly.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "JDResponseConverter.h"

@interface JDResponseConverterAssembly : TyphoonAssembly

- (id <JDResponseConverter>)responseConverter;

@end
