//
//  PONSOConverter.h
//  GistsViewer
//
//  Created by Юрий Логинов on 22.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Gist, JDGist;
@class Owner, JDOwner;
@class File, JDFile;

@protocol PONSOConverter <NSObject>

- (id)convertedPONSOWithManagedClass:(id)obj;
- (id)convertedManagedWithPONSO:(id)obj;

@end
