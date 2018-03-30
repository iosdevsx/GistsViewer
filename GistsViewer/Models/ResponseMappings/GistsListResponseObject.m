//
//  GistsListResponseObject.m
//  GistsViewer
//
//  Created by Юрий Логинов on 22.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "GistsListResponseObject.h"
#import "JDGist.h"

@implementation GistsListResponseObject

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"gists":@"data"}];
}

+ (instancetype)responseObjectWithGists:(NSArray <JDGist> *)gists {
    GistsListResponseObject *response = [GistsListResponseObject new];
    response.gists = gists;
    
    return response;
}

@end
