//
//  APIAssembly.h
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Typhoon/TyphoonAssembly.h>

@protocol API;

@interface APIAssembly : TyphoonAssembly

- (id<API>)apiService;

@end
