//
//  NSArray+Utils.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Utils)

- (NSArray *)filteredArrayByKey:(NSString *)key;
- (NSArray *)map:(id(^)(id obj))mapBlock ignoreNils:(BOOL)ignoreNils;

@end
