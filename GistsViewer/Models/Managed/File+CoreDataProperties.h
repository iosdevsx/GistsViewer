//
//  File+CoreDataProperties.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "File+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface File (CoreDataProperties)

+ (NSFetchRequest<File *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSString *filename;
@property (nullable, nonatomic, copy) NSString *language;
@property (nullable, nonatomic, copy) NSString *raw_url;
@property (nonatomic) int32_t size;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, retain) Gist *gist;

@end

NS_ASSUME_NONNULL_END
