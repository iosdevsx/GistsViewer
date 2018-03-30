//
//  JDUsersHeaderModuleFactory.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDUsersHeaderModuleInput;

@protocol JDUsersHeaderModuleFactory <NSObject>

- (id <JDUsersHeaderModuleInput>)presenterUsersHeader;

@end
