//
//  Commit+CoreDataClass.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Gist;

NS_ASSUME_NONNULL_BEGIN

@interface Commit : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Commit+CoreDataProperties.h"
