//
//  JDGistsListViewOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JDGist;

@protocol JDGistsListViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;
- (void)handleUpdateGistsFired;
- (void)handleGistSelected:(JDGist *)gist;
- (void)handleRetryTap;

@end
