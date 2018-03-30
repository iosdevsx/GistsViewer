//
//  JDGistDetailViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDGistDetailViewInput.h"
#import "JDTableViewController.h"

@protocol JDGistDetailViewOutput;

@interface JDGistDetailViewController : JDTableViewController <JDGistDetailViewInput>

@property (nonatomic, strong) id<JDGistDetailViewOutput> output;

@end
