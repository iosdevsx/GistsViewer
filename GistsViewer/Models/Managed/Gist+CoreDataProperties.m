//
//  Gist+CoreDataProperties.m
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "Gist+CoreDataProperties.h"

@implementation Gist (CoreDataProperties)

+ (NSFetchRequest<Gist *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Gist"];
}

@dynamic commits_url;
@dynamic created_at;
@dynamic forks_url;
@dynamic gistDescription;
@dynamic git_pull_url;
@dynamic git_push_url;
@dynamic html_url;
@dynamic id;
@dynamic public;
@dynamic updated_at;
@dynamic url;
@dynamic files;
@dynamic owner;
@dynamic commits;

@end
