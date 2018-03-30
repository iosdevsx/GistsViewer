//
//  JDGistDetailHeaderViewImplementation.m
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDGistDetailHeaderView.h"
#import "JDGist.h"
#import "JDFile.h"


@interface JDGistDetailHeaderView()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *gistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gistDescriptionLabel;

@end

@implementation JDGistDetailHeaderView

- (void)setupWitGist:(JDGist *)gist {
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.layer.cornerRadius = 25.f;
    JDFile *file = gist.files.firstObject;
    self.gistNameLabel.text = file.filename;
    self.gistDescriptionLabel.text = gist.description;
}

@end
