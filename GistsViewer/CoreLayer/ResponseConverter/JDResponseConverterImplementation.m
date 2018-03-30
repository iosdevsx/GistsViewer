//
//  JDResponseConverterImplementation.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDResponseConverterImplementation.h"

static NSString *const kFilesKey = @"files";
static NSString *const kDataKey = @"data";

@implementation JDResponseConverterImplementation

- (NSDictionary *)convertJSONByAddingsFilesKey:(NSArray *)json {
    NSMutableArray *convertedJson = [NSMutableArray array];
    
    for (NSDictionary *fields in json) {
        NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:fields];
        NSDictionary *files = [temp valueForKey:kFilesKey];
        NSMutableArray *normalFiles = [NSMutableArray array];
        for (NSDictionary *value in [files allValues]) {
            [normalFiles addObject:value];
        }
        [temp removeObjectForKey:kFilesKey];
        temp[kFilesKey] = [normalFiles copy];
        [convertedJson addObject:temp];
    }
    
    return @{kDataKey:[convertedJson copy]};
}

- (NSDictionary *)convertedJSON:(NSArray *)json byReplacingDictionaryToArrayByKey:(NSString *)key {
    NSMutableArray *convertedJson = [NSMutableArray array];
    
    for (NSDictionary *fields in json) {
        NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:fields];
        NSDictionary *items = [temp valueForKey:key];
        NSMutableArray *convertedItems = [NSMutableArray array];
        for (NSDictionary *value in [items allValues]) {
            [convertedItems addObject:value];
        }
        [temp removeObjectForKey:key];
        temp[key] = [convertedItems copy];
        [convertedJson addObject:temp];
    }
    
    return @{kDataKey:[convertedJson copy]};
}

- (NSDictionary *)convertedJSONDictionary:(NSDictionary *)json byReplacingDictionaryToArrayByKey:(NSString *)key {
    NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithDictionary:json];
    
    NSDictionary *items = [temp valueForKey:key];
    NSMutableArray *convertedItems = [NSMutableArray array];
    for (NSDictionary *value in [items allValues]) {
        [convertedItems addObject:value];
    }
    [temp removeObjectForKey:key];
    temp[key] = [convertedItems copy];
    
    return [temp copy];
}

- (NSDictionary *)convertedJSONByAddingMainDataKey:(NSArray *)json {
    return @{kDataKey:json};
}

@end
