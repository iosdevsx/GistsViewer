//
//  JDGistDetailViewInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JDGist;

@protocol JDGistDetailViewInput <NSObject>

- (void)setupInitialStateWithGist:(JDGist *)gist;
- (void)updateCommitsCount:(NSInteger)count;
- (void)updateFilesCount:(NSInteger)count;
- (void)showError:(NSString *)error;


@end
