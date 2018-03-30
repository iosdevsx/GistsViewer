//
//  JDCommitListViewInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDCommitListViewInput <NSObject>

- (void)setupInitialStateWithCommits:(NSArray *)commits;

@end