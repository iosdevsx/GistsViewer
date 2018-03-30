//
//  JDGistsListInteractorOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDGistsListInteractorOutput <NSObject>

- (void)gistsFetched:(NSArray *)gists isCached:(BOOL)isCached;
- (void)gistsFetchFailedWithError:(NSError *)error;

@end
