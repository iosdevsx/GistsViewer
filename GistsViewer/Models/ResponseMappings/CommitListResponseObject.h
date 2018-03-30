//
//  CommitListResponseObject.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>


@protocol JDCommit;

@interface CommitListResponseObject : JSONModel

@property (nonatomic, strong) NSArray <JDCommit> *commits;

@end
