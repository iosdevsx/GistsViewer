//
//  JDDashboardViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 16/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDDashboardViewInput.h"

@protocol JDDashboardViewOutput;

@interface JDDashboardViewController : UIViewController <JDDashboardViewInput>

@property (nonatomic, strong) id<JDDashboardViewOutput> output;

@end
