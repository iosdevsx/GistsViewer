//
//  JDGist.h
//  GistsViewer
//
//  Created by Юрий Логинов on 22.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "JDCommit.h"

@protocol JDGist, JDFile;
@class JDOwner, JDFile;

@interface JDGist : JSONModel

@property (nonatomic, strong) NSString <Optional> *id;
@property (nonatomic, strong) NSString <Optional> *url;
@property (nonatomic, strong) NSString <Optional> *description;
@property (nonatomic, strong) NSString <Optional> *forks_url;
@property (nonatomic, strong) NSString <Optional> *commits_url;
@property (nonatomic, strong) NSString <Optional> *git_pull_url;
@property (nonatomic, strong) NSString <Optional> *git_push_url;
@property (nonatomic, strong) NSString <Optional> *html_url;
@property (nonatomic, assign) BOOL public;
@property (nonatomic, strong) NSDate *created_at;
@property (nonatomic, strong) NSDate *updated_at;
@property (nonatomic, strong) JDOwner *owner;
@property (nonatomic, strong) NSArray <JDFile> *files;

@end
