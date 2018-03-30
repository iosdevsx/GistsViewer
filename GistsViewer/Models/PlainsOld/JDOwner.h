//
//  JDOwner.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JSONModel.h"

@protocol JDOwner, JDGist, JDCommit;

@interface JDOwner : JSONModel

@property (nonatomic, strong) NSString *login;
@property (nonatomic, assign) int32_t id;
@property (nonatomic, strong) NSString <Optional> *avatar_url;
@property (nonatomic, strong) NSString <Optional> *gravatar_url;
@property (nonatomic, strong) NSString <Optional> *url;
@property (nonatomic, strong) NSString <Optional> *html_url;
@property (nonatomic, strong) NSString <Optional> *followers_url;
@property (nonatomic, strong) NSString <Optional> *following_url;
@property (nonatomic, strong) NSString <Optional> *gists_url;
@property (nonatomic, strong) NSString <Optional> *starred_url;
@property (nonatomic, strong) NSString <Optional> *subscriptions_url;
@property (nonatomic, strong) NSString <Optional> *organizations_url;
@property (nonatomic, strong) NSString <Optional> *repos_url;
@property (nonatomic, strong) NSString <Optional> *events_url;
@property (nonatomic, strong) NSString <Optional> *received_events_url;
@property (nonatomic, strong) NSString <Optional> *type;
@property (nonatomic, assign) BOOL site_admin;
@property (nonatomic, strong) NSArray <JDGist, Optional> *gists;
@property (nonatomic, strong) NSArray <JDCommit, Optional> *commits;

@end
