//
//  JDCommitCell.m
//  GistsViewer
//
//  Created by Юрий Логинов on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDCommitCell.h"
#import "JDCommit.h"


@interface JDCommitCell()

@property (weak, nonatomic) IBOutlet UILabel *gistIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *additionsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *deletionsCountLabel;

@end

@implementation JDCommitCell

- (void)setupWithCommit:(JDCommit *)commit {
    self.gistIdLabel.text = commit.version;
    self.totalCountLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)commit.total];
    self.additionsCountLabel.text = [NSString stringWithFormat:@"+ %lu", (unsigned long)commit.additions];
    self.deletionsCountLabel.text = [NSString stringWithFormat:@"- %lu", (unsigned long)commit.deletions];
}

@end
