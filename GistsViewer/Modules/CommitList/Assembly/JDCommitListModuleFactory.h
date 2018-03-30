//
//  JDCommitListModuleFactory.h
//  GistsViewer
//
//  Created by Юрий Логинов on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol JDCommitListModuleInput;

@protocol JDCommitListModuleFactory <NSObject>

- (id <JDCommitListModuleInput>)presenterCommitList;

@end
