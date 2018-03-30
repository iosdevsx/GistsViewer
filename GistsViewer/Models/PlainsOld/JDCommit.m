//
//  JDCommit.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDCommit.h"

@implementation JDCommit

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"total":@"change_status.total",
                                                                  @"additions":@"change_status.additions",
                                                                  @"deletions":@"change_status.deletions"}];
}

@end
