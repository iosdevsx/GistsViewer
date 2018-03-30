//
//  JDUsersHeaderModuleOutput.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDOwner;

@protocol JDUsersHeaderModuleOutput <NSObject>

- (void)usersHeaderViewPrepared;
- (void)selectedUser:(JDOwner *)user;

@end
