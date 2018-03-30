//
//  JDCoreDataService.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDRelation;

@protocol JDCoreDataService <NSObject>

- (NSArray *)fetchCachedItemsWithClass:(Class)aClass;

- (NSArray *)fetchItemsRelatedTo:(Class)aClass withPredicate:(NSPredicate *)predicate;

- (void)cacheItems:(NSArray *)items
          forClass:(Class)aClass
         predicate:(NSPredicate *)predicate;

- (void)cacheItems:(NSArray *)items
          forClass:(Class)aClass
         predicate:(NSPredicate *)predicate
          relation:(JDRelation *)relation;

@end
