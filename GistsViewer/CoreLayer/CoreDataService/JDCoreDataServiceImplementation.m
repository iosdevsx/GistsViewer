//
//  JDCoreDataServiceImplementation.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDCoreDataServiceImplementation.h"
#import <MagicalRecord/MagicalRecord.h>
#import "NSArray+Utils.h"
#import "JDRelation.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

static NSInteger const kFetchLimith = 30;

@implementation JDCoreDataServiceImplementation

#pragma mark - Fetching

- (NSArray *)fetchCachedItemsWithClass:(Class)aClass {
    if (![aClass isSubclassOfClass:[NSManagedObject class]]) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [aClass MR_createFetchRequest];
    fetchRequest.fetchLimit = kFetchLimith;
    NSArray *items = [aClass MR_executeFetchRequest:fetchRequest];
    NSArray *models = [items map:^id(id obj) {
        return [self.ponsoConverter convertedPONSOWithManagedClass:obj];
    } ignoreNils:NO];
    
    return models;
}

- (NSArray *)fetchItemsRelatedTo:(Class)aClass
                   withPredicate:(NSPredicate *)predicate {
    NSArray *items = [aClass MR_findAllWithPredicate:predicate];
    return [items map:^id(id obj) {
        return [self.ponsoConverter convertedPONSOWithManagedClass:obj];
    } ignoreNils:NO];
}

#pragma mark - Caching

- (void)cacheItems:(NSArray *)items
          forClass:(Class)aClass
         predicate:(NSPredicate *)predicate {
    [self cacheItems:items forClass:aClass predicate:predicate relation:nil];
}

- (void)cacheItems:(NSArray *)items
          forClass:(Class)aClass
         predicate:(NSPredicate *)predicate
          relation:(JDRelation *)relation {
    if (![aClass isSubclassOfClass:[NSManagedObject class]]) {
        return;
    }
    
    [self deleteEntities:aClass withPredicate:predicate];
    
    NSMutableSet *set = [NSMutableSet set];
    for (id item in items) {
        Class obj = [self.ponsoConverter convertedManagedWithPONSO:item];
        [set addObject:obj];
    }
    
    if (relation) {
        if ([relation.objToRelate respondsToSelector:relation.selectorToRelate]) {
            SuppressPerformSelectorLeakWarning([relation.objToRelate performSelector:relation.selectorToRelate withObject:set];);
        }
    }
    
    [self save];
}

#pragma mark - Private

- (void)deleteEntities:(Class)aClass
         withPredicate:(NSPredicate *)predicate {
    if (predicate) {
        [aClass MR_deleteAllMatchingPredicate:predicate];
    } else {
        [aClass MR_truncateAll];
    }
}

- (void)save {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
}


@end
