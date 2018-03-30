//
//  File+CoreDataClass.h
//  GistsViewer
//
//  Created by Yury Loginov on 23.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Gist;

NS_ASSUME_NONNULL_BEGIN

@interface File : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "File+CoreDataProperties.h"
