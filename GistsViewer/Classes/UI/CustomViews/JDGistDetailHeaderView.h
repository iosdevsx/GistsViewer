//
//  JDGistDetailHeaderView.h
//  GistsViewer
//
//  Created by Юрий Логинов on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JDGist;

@interface JDGistDetailHeaderView : UIView

+ (instancetype)view;

- (void)setupWitGist:(JDGist *)gist;

@end
