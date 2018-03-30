//
//  JDFileCell.h
//  GistsViewer
//
//  Created by Yury Loginov on 28.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDTableCell.h"

@class JDFile;

@interface JDFileCell : JDTableCell

- (void)setupWithFile:(JDFile *)file;

@end
