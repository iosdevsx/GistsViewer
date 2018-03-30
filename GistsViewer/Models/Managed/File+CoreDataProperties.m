//
//  File+CoreDataProperties.m
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "File+CoreDataProperties.h"

@implementation File (CoreDataProperties)

+ (NSFetchRequest<File *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"File"];
}

@dynamic content;
@dynamic filename;
@dynamic language;
@dynamic raw_url;
@dynamic size;
@dynamic type;
@dynamic gist;

@end
