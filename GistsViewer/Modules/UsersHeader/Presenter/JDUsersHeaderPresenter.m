//
//  JDUsersHeaderPresenter.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDUsersHeaderPresenter.h"
#import "JDUsersHeaderModuleOutput.h"
#import "JDUsersHeaderViewInput.h"
#import "JDUsersHeaderInteractorInput.h"
#import "JDUsersHeaderRouterInput.h"


@interface JDUsersHeaderPresenter()

@property (nonatomic, weak) id <JDUsersHeaderModuleOutput> output;
@property (nonatomic, strong) NSArray *users;

@end

@implementation JDUsersHeaderPresenter

#pragma mark - Методы JDUsersHeaderModuleInput

- (void)configureModuleWithOutputPoint:(id <JDUsersHeaderModuleOutput>)output {
    self.output = output;
}

- (void)setupUsers:(NSArray *)users {
    self.users = users;
    [self.view updateViewStateWithUsers:users];
}

#pragma mark - Методы JDUsersHeaderViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)handleTapCellAtIndex:(NSInteger)index {
    if (index >= self.users.count) {
        return;
    }
    
    [self.output selectedUser:self.users[index]];
}

#pragma mark - Методы JDUsersHeaderInteractorOutput

@end
