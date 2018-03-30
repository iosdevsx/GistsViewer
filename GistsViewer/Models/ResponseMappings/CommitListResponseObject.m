//
//  CommitListResponseObject.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "CommitListResponseObject.h"

@implementation CommitListResponseObject

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"commits":@"data"}];
}

@end
