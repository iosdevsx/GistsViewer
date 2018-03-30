//
//  Commit+CoreDataProperties.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "Commit+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Commit (CoreDataProperties)

+ (NSFetchRequest<Commit *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *version;
@property (nonatomic) int32_t total;
@property (nonatomic) int32_t additions;
@property (nonatomic) int32_t deletions;
@property (nullable, nonatomic, copy) NSDate *commitedAt;
@property (nullable, nonatomic, retain) Gist *gist;

@end

NS_ASSUME_NONNULL_END
