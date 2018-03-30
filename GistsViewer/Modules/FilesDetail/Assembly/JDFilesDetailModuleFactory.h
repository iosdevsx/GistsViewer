//
//  JDFilesDetailModuleFactory.h
//  GistsViewer
//
//  Created by Yury Loginov on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JDFilesDetailModuleInput.h"

@protocol JDFilesDetailModuleFactory <NSObject>

- (id <JDFilesDetailModuleInput>)presenterFilesDetail;

@end
