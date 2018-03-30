//
//  JDGistsListModuleFactory.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDGistsListModuleInput.h"

@protocol JDGistsListModuleFactory <NSObject>

- (id <JDGistsListModuleInput>)presenterGistsList;

@end
