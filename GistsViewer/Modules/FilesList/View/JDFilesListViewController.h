//
//  JDFilesListViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDTableViewController.h"
#import "JDFilesListViewInput.h"

@protocol JDFilesListViewOutput;

@interface JDFilesListViewController : JDTableViewController <JDFilesListViewInput>

@property (nonatomic, strong) id<JDFilesListViewOutput> output;

@end
