//
//  JDCoreDataServiceImplementation.h
//  GistsViewer
//
//  Created by Yury Loginov on 29.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PONSOConverter.h"

@interface JDCoreDataServiceImplementation : NSObject

@property (nonatomic, strong) id <PONSOConverter> ponsoConverter;

@end
