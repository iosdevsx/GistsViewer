//
//  Owner+CoreDataProperties.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import "Owner+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Owner (CoreDataProperties)

+ (NSFetchRequest<Owner *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *avatar_url;
@property (nullable, nonatomic, copy) NSString *events_url;
@property (nullable, nonatomic, copy) NSString *followers_url;
@property (nullable, nonatomic, copy) NSString *following_url;
@property (nullable, nonatomic, copy) NSString *gists_url;
@property (nullable, nonatomic, copy) NSString *gravatar_url;
@property (nullable, nonatomic, copy) NSString *html_url;
@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *login;
@property (nullable, nonatomic, copy) NSString *organizations_url;
@property (nullable, nonatomic, copy) NSString *received_events_url;
@property (nullable, nonatomic, copy) NSString *repos_url;
@property (nonatomic) BOOL size_admin;
@property (nullable, nonatomic, copy) NSString *starred_url;
@property (nullable, nonatomic, copy) NSString *subscriptions_url;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, copy) NSString *url;
@property (nullable, nonatomic, retain) NSSet<Gist *> *gist;

@end

@interface Owner (CoreDataGeneratedAccessors)

- (void)addGistObject:(Gist *)value;
- (void)removeGistObject:(Gist *)value;
- (void)addGist:(NSSet<Gist *> *)values;
- (void)removeGist:(NSSet<Gist *> *)values;

@end

NS_ASSUME_NONNULL_END
