//
//  JDGistDetailCell.m
//  GistsViewer
//
//  Created by Yury Loginov on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDGistDetailCell.h"


@interface JDGistDetailCell()

@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loaderView;

@end

@implementation JDGistDetailCell

+ (instancetype)cellWithType:(DetailType)type
                    leftText:(NSString *)leftText
                   rightText:(NSString *)rightText {
    JDGistDetailCell *cell = [JDGistDetailCell loadNib];
    cell.rightLabel.text = rightText;
    cell.leftLabel.text = leftText;
    cell.iconImageView.image = [cell imageForType:type];
    cell.height = UITableViewAutomaticDimension;
    [cell showLoading];
    
    return cell;
}

- (void)updateRightText:(NSString *)text {
    self.rightLabel.text = text;
    [self hideLoading];
}

- (void)showLoading {
    [self.loaderView startAnimating];
    [self.loaderView setHidden:NO];
    [self.rightLabel setHidden:YES];
}

- (void)hideLoading {
    [self.loaderView stopAnimating];
    [self.loaderView setHidden:YES];
    [self.rightLabel setHidden:NO];
}

- (UIImage *)imageForType:(DetailType)type {
    switch (type) {
        case DetailTypeFiles: return [UIImage imageNamed:@"files"]; break;
        case DetailTypeForks: return [UIImage imageNamed:@"forks"]; break;
        case DetailTypeOwner: return [UIImage imageNamed:@"user"]; break;
        case DetailTypeCommits: return [UIImage imageNamed:@"commits"]; break;
        case DetailTypeComments: return [UIImage imageNamed:@"comments"]; break;
    }
    
    return nil;
}

@end
