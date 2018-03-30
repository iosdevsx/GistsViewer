//
//  JDUsersHeaderCell.h
//  GistsViewer
//
//  Created by Yury Loginov on 27.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDOwner;

@interface JDUsersHeaderCell : UIView

+ (instancetype)cellWithUser:(JDOwner *)user;

@end
