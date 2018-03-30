//
//  JDCommit.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "JDGist.h"

@protocol JDCommit;
@class JDGist;

@interface JDCommit : JSONModel

@property (nonatomic, strong) NSString *version;
@property (nonatomic, assign) int32_t total;
@property (nonatomic, assign) int32_t additions;
@property (nonatomic, assign) int32_t deletions;
@property (nonatomic, strong) NSDate *committed_at;
@property (nonatomic, strong) JDGist <Optional> *gist;

@end
