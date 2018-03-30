//
//  APIAssembly.m
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "APIAssembly.h"
#import "API.h"
#import "APIImplementation.h"
#import <AFNetworking.h>
#import "JDRoutes.h"


@implementation APIAssembly

- (id<API>)apiService {
    return [TyphoonDefinition withClass:[APIImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(sessionManager) with:[self sessionManager]];
        [definition setScope:TyphoonScopeSingleton];
    }];
}

- (AFHTTPSessionManager *)sessionManager {
    return [TyphoonDefinition withClass:[AFHTTPSessionManager class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithBaseURL:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[NSURL URLWithString:BaseURL]];
        }];
        [definition injectProperty:@selector(requestSerializer) with:[self requestSerializer]];
    }];
}

- (AFJSONRequestSerializer *)requestSerializer {
    return [TyphoonDefinition withClass:[AFJSONRequestSerializer class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(serializer)];
        [definition injectMethod:@selector(setValue:forHTTPHeaderField:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:@"application/json"];
            [method injectParameterWith:@"Content-Type"];
        }];
    }];
}

@end
