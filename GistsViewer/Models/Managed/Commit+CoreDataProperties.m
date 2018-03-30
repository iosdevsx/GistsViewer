//
//  Commit+CoreDataProperties.m
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "Commit+CoreDataProperties.h"

@implementation Commit (CoreDataProperties)

+ (NSFetchRequest<Commit *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Commit"];
}

@dynamic version;
@dynamic total;
@dynamic additions;
@dynamic deletions;
@dynamic commitedAt;
@dynamic gist;

@end
