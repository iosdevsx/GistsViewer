//
//  JDCommitCell.h
//  GistsViewer
//
//  Created by Юрий Логинов on 30.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "JDTableCell.h"


@class JDCommit;

@interface JDCommitCell : JDTableCell

- (void)setupWithCommit:(JDCommit *)commit;

@end
