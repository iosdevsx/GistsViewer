//
//  Gist+CoreDataClass.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class File, Owner;

NS_ASSUME_NONNULL_BEGIN

@interface Gist : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "Gist+CoreDataProperties.h"
