//
//  JDGistsListModuleOutput.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDGist;

@protocol JDGistsListModuleOutput <NSObject>

- (void)gistsLoaded:(NSArray *)gists isCached:(BOOL)isCached;
- (void)gistSelected:(JDGist *)gist;

@end
