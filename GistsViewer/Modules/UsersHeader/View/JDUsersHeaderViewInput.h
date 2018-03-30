//
//  JDUsersHeaderViewInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDUsersHeaderViewInput <NSObject>

- (void)setupInitialState;
- (void)updateViewStateWithUsers:(NSArray *)users;

@end
