//
//  JDGistDetailViewOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@protocol JDGistDetailViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;

- (void)handleCellTapForType:(DetailType)type;

@end
