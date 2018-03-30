//
//  JDUsersHeaderCell.m
//  GistsViewer
//
//  Created by Yury Loginov on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDUsersHeaderCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "JDOwner.h"


@interface JDUsersHeaderCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *badgeLabel;

@end

@implementation JDUsersHeaderCell

+ (instancetype)cellWithUser:(JDOwner *)user {
    JDUsersHeaderCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    cell.avatarImageView.layer.masksToBounds = YES;
    cell.avatarImageView.layer.cornerRadius = 25.f;
    [cell.avatarImageView sd_setImageWithURL:[NSURL URLWithString:user.avatar_url]];
    cell.badgeLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)user.gists.count];
    
    return cell;
}

@end
