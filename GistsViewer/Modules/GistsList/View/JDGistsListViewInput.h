//
//  JDGistsListViewInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDGistsListViewInput <NSObject>

- (void)setupInitialState;
- (void)updateViewWithGists:(NSArray *)gists;

- (void)showLoader;
- (void)hideLoader;

- (void)showError:(NSString *)error;

- (void)showStubViewWithError:(NSString *)error;
- (void)hideStubView;

@end
