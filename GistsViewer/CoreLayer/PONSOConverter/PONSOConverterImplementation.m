//
//  PONSOConverterImplementation.m
//  GistsViewer
//
//  Created by Юрий Логинов on 22.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "PONSOConverterImplementation.h"
#import "Gist+CoreDataClass.h"
#import "JDGist.h"
#import "Owner+CoreDataClass.h"
#import "JDOwner.h"
#import "File+CoreDataClass.h"
#import "JDFile.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation PONSOConverterImplementation

#pragma mark - Gist

- (id)convertedPONSOWithManagedClass:(id)obj {
    if ([obj isKindOfClass:[Gist class]]) {
        return [self convertedGistWithManaged:obj];
    }
    if ([obj isKindOfClass:[Owner class]]) {
        return [self convertedOwnerWithManaged:obj];
    }
    if ([obj isKindOfClass:[File class]]) {
        return [self convertedFileWithManaged:obj];
    }
    
    return nil;
}

- (id)convertedManagedWithPONSO:(id)obj {
    if ([obj isKindOfClass:[JDGist class]]) {
        return [self convertedManagedGistWithPONSO:obj];
    }
    if ([obj isKindOfClass:[JDOwner class]]) {
        return [self convertedManagedOwnerWithPONSO:obj];
    }
    if ([obj isKindOfClass:[JDFile class]]) {
        return [self convertedManagedFileWithPONSO:obj];
    }
    
    return nil;
}

#pragma mark - Private

- (id)convertedGistWithManaged:(Gist *)gist {
    JDGist *gistPlainsOld = [JDGist new];
    
    gistPlainsOld.id = gist.id;
    gistPlainsOld.url = gist.url;
    gistPlainsOld.description = gist.gistDescription;
    gistPlainsOld.forks_url = gist.forks_url;
    gistPlainsOld.commits_url = gist.commits_url;
    gistPlainsOld.git_pull_url = gist.git_pull_url;
    gistPlainsOld.git_push_url = gist.git_push_url;
    gistPlainsOld.html_url = gist.html_url;
    gistPlainsOld.public = gist.public;
    gistPlainsOld.created_at = gist.created_at;
    gistPlainsOld.updated_at = gist.updated_at;
    gistPlainsOld.owner = [self convertedOwnerWithManaged:gist.owner];
    
    NSMutableArray *convertedFiles = [NSMutableArray array];
    for (File *file in [gist.files allObjects]) {
        [convertedFiles addObject:[self convertedFileWithManaged:file]];
    }
    
    gistPlainsOld.files = [convertedFiles copy];

    return gistPlainsOld;
}

- (id)convertedManagedGistWithPONSO:(JDGist *)gist {
    Gist *managedGist = [Gist MR_createEntity];
    
    managedGist.id = gist.id;
    managedGist.url = gist.url;
    managedGist.gistDescription = gist.description;
    managedGist.forks_url = gist.forks_url;
    managedGist.commits_url = gist.commits_url;
    managedGist.git_pull_url = gist.git_pull_url;
    managedGist.git_push_url = gist.git_push_url;
    managedGist.html_url = gist.html_url;
    managedGist.public = gist.public;
    managedGist.created_at = gist.created_at;
    managedGist.updated_at = gist.updated_at;
    managedGist.owner = [self convertedManagedOwnerWithPONSO:gist.owner];
    
    NSMutableSet *convertedFiles = [NSMutableSet set];
    for (JDFile *file in gist.files) {
        [convertedFiles addObject:[self convertedManagedFileWithPONSO:file]];
    }
    
    managedGist.files = [convertedFiles copy];
    
    return managedGist;
}

#pragma mark - Owner

- (id)convertedOwnerWithManaged:(Owner *)owner {
    JDOwner *ownerPlainsOld = [JDOwner new];
    ownerPlainsOld.login = owner.login;
    ownerPlainsOld.id = owner.id;
    ownerPlainsOld.avatar_url = owner.avatar_url;
    ownerPlainsOld.gravatar_url = owner.gravatar_url;
    ownerPlainsOld.url = owner.url;
    ownerPlainsOld.html_url = owner.html_url;
    ownerPlainsOld.followers_url = owner.followers_url;
    ownerPlainsOld.following_url = owner.following_url;
    ownerPlainsOld.gists_url = owner.gists_url;
    ownerPlainsOld.starred_url = owner.starred_url;
    ownerPlainsOld.subscriptions_url = owner.subscriptions_url;
    ownerPlainsOld.organizations_url = owner.organizations_url;
    ownerPlainsOld.repos_url = owner.repos_url;
    ownerPlainsOld.events_url = owner.events_url;
    ownerPlainsOld.received_events_url = owner.received_events_url;
    ownerPlainsOld.type = owner.type;
    ownerPlainsOld.site_admin = owner.size_admin;
    return ownerPlainsOld;
}

- (id)convertedManagedOwnerWithPONSO:(JDOwner *)owner {
    Owner *managedOwner = [Owner MR_createEntity];
    managedOwner.login = owner.login;
    managedOwner.id = owner.id;
    managedOwner.avatar_url = owner.avatar_url;
    managedOwner.gravatar_url = owner.gravatar_url;
    managedOwner.url = owner.url;
    managedOwner.html_url = owner.html_url;
    managedOwner.followers_url = owner.followers_url;
    managedOwner.following_url = owner.following_url;
    managedOwner.gists_url = owner.gists_url;
    managedOwner.starred_url = owner.starred_url;
    managedOwner.subscriptions_url = owner.subscriptions_url;
    managedOwner.organizations_url = owner.organizations_url;
    managedOwner.repos_url = owner.repos_url;
    managedOwner.events_url = owner.events_url;
    managedOwner.received_events_url = owner.received_events_url;
    managedOwner.type = owner.type;
    managedOwner.size_admin = owner.site_admin;
    return managedOwner;
}

#pragma mark - File

- (id)convertedFileWithManaged:(File *)file {
    JDFile *filePlainsOld = [JDFile new];
    
    filePlainsOld.filename = file.filename;
    filePlainsOld.type = file.type;
    filePlainsOld.language = file.language;
    filePlainsOld.raw_url = file.raw_url;
    filePlainsOld.content = file.content;
    filePlainsOld.size = file.size;
    
    return filePlainsOld;
}

- (id)convertedManagedFileWithPONSO:(JDFile *)file {
    File *managedFile = [File MR_createEntity];
    
    managedFile.filename = file.filename;
    managedFile.type = file.type;
    managedFile.language = file.language;
    managedFile.raw_url = file.raw_url;
    managedFile.content = file.content;
    managedFile.size = file.size;
    
    return managedFile;
}

@end
