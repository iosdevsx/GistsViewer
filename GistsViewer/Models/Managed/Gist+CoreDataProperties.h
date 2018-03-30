//
//  Gist+CoreDataProperties.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "Gist+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Gist (CoreDataProperties)

+ (NSFetchRequest<Gist *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *commits_url;
@property (nullable, nonatomic, copy) NSDate *created_at;
@property (nullable, nonatomic, copy) NSString *forks_url;
@property (nullable, nonatomic, copy) NSString *gistDescription;
@property (nullable, nonatomic, copy) NSString *git_pull_url;
@property (nullable, nonatomic, copy) NSString *git_push_url;
@property (nullable, nonatomic, copy) NSString *html_url;
@property (nullable, nonatomic, copy) NSString *id;
@property (nonatomic) BOOL public;
@property (nullable, nonatomic, copy) NSDate *updated_at;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, retain) NSSet<File *> *files;
@property (nullable, nonatomic, retain) Owner *owner;
@property (nullable, nonatomic, retain) NSSet<Commit *> *commits;

@end

@interface Gist (CoreDataGeneratedAccessors)

- (void)addFilesObject:(File *)value;
- (void)removeFilesObject:(File *)value;
- (void)addFiles:(NSSet<File *> *)values;
- (void)removeFiles:(NSSet<File *> *)values;

- (void)addCommitsObject:(Commit *)value;
- (void)removeCommitsObject:(Commit *)value;
- (void)addCommits:(NSSet<Commit *> *)values;
- (void)removeCommits:(NSSet<Commit *> *)values;

@end

NS_ASSUME_NONNULL_END
