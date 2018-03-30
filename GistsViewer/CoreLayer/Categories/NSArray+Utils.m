//
//  NSArray+Utils.m
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

- (NSArray *)filteredArrayByKey:(NSString *)key {
    NSMutableSet *set = [NSMutableSet set];
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in self) {
        if (![set containsObject:[obj valueForKey:key]]) {
            [set addObject:[obj valueForKey:key]];
            [array addObject:obj];
        }
    }
    return [array copy];
}

- (NSArray *)map:(id(^)(id obj))mapBlock ignoreNils:(BOOL)ignoreNils {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        id mappedObj = mapBlock(object);
        
        if (!mappedObj) {
            if (ignoreNils) {
                continue;
            }
            NSAssert(mappedObj != nil, @"Got nil object during mapping! Input object - %@", object);
        }
        
        [result addObject:mappedObj];
    }
    return [result copy];
}

@end
