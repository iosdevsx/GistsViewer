//
//  Owner+CoreDataProperties.m
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "Owner+CoreDataProperties.h"

@implementation Owner (CoreDataProperties)

+ (NSFetchRequest<Owner *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Owner"];
}

@dynamic avatar_url;
@dynamic events_url;
@dynamic followers_url;
@dynamic following_url;
@dynamic gists_url;
@dynamic gravatar_url;
@dynamic html_url;
@dynamic id;
@dynamic login;
@dynamic organizations_url;
@dynamic received_events_url;
@dynamic repos_url;
@dynamic size_admin;
@dynamic starred_url;
@dynamic subscriptions_url;
@dynamic type;
@dynamic url;
@dynamic gist;

@end
