//
//  JDGistsListViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDGistsListViewInput.h"
#import "JDTableViewController.h"

@protocol JDGistsListViewOutput;

@interface JDGistsListViewController : JDTableViewController <JDGistsListViewInput>

@property (nonatomic, strong) id<JDGistsListViewOutput> output;

@end
