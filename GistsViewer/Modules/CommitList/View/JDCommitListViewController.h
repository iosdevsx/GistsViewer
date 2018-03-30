//
//  JDCommitListViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDCommitListViewInput.h"
#import "JDTableViewController.h"

@protocol JDCommitListViewOutput;

@interface JDCommitListViewController : JDTableViewController <JDCommitListViewInput>

@property (nonatomic, strong) id<JDCommitListViewOutput> output;

@end
