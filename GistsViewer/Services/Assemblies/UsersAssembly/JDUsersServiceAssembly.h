//
//  JDUsersServiceAssembly.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "JDUsersService.h"

@interface JDUsersServiceAssembly : TyphoonAssembly

- (id <JDUsersService>)usersService;

@end
