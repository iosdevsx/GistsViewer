//
//  JDDashboardInteractorOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDDashboardInteractorOutput <NSObject>

- (void)usersFetched:(NSArray *)users;

@end
