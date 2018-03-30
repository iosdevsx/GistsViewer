//
//  GistsListResponseObject.h
//  GistsViewer
//
//  Created by Юрий Логинов on 22.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@protocol JDGist;
@class JDGist;

@interface GistsListResponseObject : JSONModel

@property (nonatomic, strong) NSArray <JDGist> *gists;

+ (instancetype)responseObjectWithGists:(NSArray *)gists;

@end
