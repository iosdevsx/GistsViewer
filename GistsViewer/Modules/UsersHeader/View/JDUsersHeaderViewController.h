//
//  JDUsersHeaderViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JDUsersHeaderViewInput.h"

@protocol JDUsersHeaderViewOutput;

@interface JDUsersHeaderViewController : UIViewController <JDUsersHeaderViewInput>

@property (nonatomic, strong) id<JDUsersHeaderViewOutput> output;

@end
