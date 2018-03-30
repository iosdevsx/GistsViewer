//
//  API.h
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@protocol API <NSObject>

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end
