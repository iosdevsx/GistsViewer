//
//  JDFilesDetailViewController.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JDFilesDetailViewInput.h"

@protocol JDFilesDetailViewOutput;

@interface JDFilesDetailViewController : UIViewController <JDFilesDetailViewInput>

@property (nonatomic, strong) id<JDFilesDetailViewOutput> output;

@end
