//
//  JDCoreDataServiceAssembly.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "JDCoreDataService.h"

@interface JDCoreDataServiceAssembly : TyphoonAssembly

- (id <JDCoreDataService>)coreDataService;

@end
