//
//  FilesListResponseObject.m
//  GistsViewer
//
//  Created by Юрий Логинов on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "FilesListResponseObject.h"

@implementation FilesListResponseObject

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"files":@"data.files"}];
}

@end
