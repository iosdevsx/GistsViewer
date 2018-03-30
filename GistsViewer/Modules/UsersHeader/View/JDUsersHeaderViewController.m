//
//  JDUsersHeaderViewController.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDUsersHeaderViewController.h"
#import "JDUsersHeaderViewOutput.h"
#import "JDUsersHeaderCell.h"
#import "JDOwner.h"


@interface JDUsersHeaderViewController()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation JDUsersHeaderViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDUsersHeaderViewInput

- (void)setupInitialState {
    [self.scrollView setShowsVerticalScrollIndicator:NO];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
}

- (void)updateViewStateWithUsers:(NSArray *)users {
    CGFloat itemsTopOffset = 0.0f;
    CGFloat itemsInterval = 0.0f;
    CGFloat currentXOffset = 0.0f;
    
    for (int i = 0; i < users.count; i++) {
        JDOwner *user = users[i];
        
        JDUsersHeaderCell *cell = [JDUsersHeaderCell cellWithUser:user];
        
        CGRect newFrame = CGRectMake(currentXOffset, itemsTopOffset, cell.frame.size.width, cell.frame.size.height);
        cell.frame = newFrame;
        currentXOffset += cell.frame.size.width + itemsInterval;
        [self.scrollView addSubview:cell];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTap:)];
        [cell addGestureRecognizer:tapGesture];
        cell.tag = i;
    }
    
    self.scrollView.contentSize = CGSizeMake(currentXOffset, self.scrollView.frame.size.height);
    [self.view layoutIfNeeded];
}

- (void)cellTap:(UITapGestureRecognizer *)recognizer {
    [self.output handleTapCellAtIndex:recognizer.view.tag];
}

@end
