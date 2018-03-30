//
//  JDGistDetailHeaderView.m
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDGistDetailHeaderView.h"
#import "JDGist.h"
#import "JDFile.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "JDOwner.h"

@interface JDGistDetailHeaderView()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *gistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gistDescriptionLabel;

@end

@implementation JDGistDetailHeaderView

+ (instancetype)view {
    JDGistDetailHeaderView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return view;
}

- (void)setupWitGist:(JDGist *)gist {
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:gist.owner.avatar_url]];
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 25.f;
    JDFile *file = gist.files.firstObject;
    self.gistNameLabel.text = file.filename;
    self.gistDescriptionLabel.text = gist.description;
}

@end

