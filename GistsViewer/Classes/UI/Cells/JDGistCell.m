//
//  JDGistCell.m
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDGistCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "JDGist.h"
#import "JDOwner.h"
#import "JDFile.h"


@interface JDGistCell()

@property (nonatomic, strong) NSDateFormatter *formatter;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *gistLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation JDGistCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupWithGist:(JDGist *)gist {
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 15.f;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:gist.owner.avatar_url]];
    self.dateLabel.text = [self.formatter stringFromDate:gist.created_at];
    self.descriptionLabel.text = gist.description;
    self.gistLabel.text = [gist.files.firstObject filename];
}

- (NSDateFormatter *)formatter {
    if (!_formatter) {
        _formatter = [NSDateFormatter new];
        [_formatter setDateFormat:@"dd.MM.yyyy"];
    }
    return _formatter;
}

@end
