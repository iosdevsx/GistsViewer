//
//  JDGistDetailInteractorInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDGist;

@protocol JDGistDetailInteractorInput <NSObject>

- (void)fetchCommitsForGist:(JDGist *)gist;
- (void)fetchFilesForGist:(JDGist *)gist;

@end
