//
//  JDGistCell.h
//  GistsViewer
//
//  Created by Yury Loginov on 26.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDTableCell.h"

@class JDGist;

@interface JDGistCell : JDTableCell

- (void)setupWithGist:(JDGist *)gist;

@end
