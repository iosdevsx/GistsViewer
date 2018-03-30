//
//  JDRoutes.m
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDRoutes.h"

@implementation JDRoutes

NSString *const BaseURL = @"https://api.github.com";
NSString *const GistsList = @"/gists/public";
NSString *const UserPublicGists = @"/users/:id/gists";
NSString *const GistCommits = @"/gists/:id/commits";
NSString *const GistDetail = @"/gists/:id";

@end
