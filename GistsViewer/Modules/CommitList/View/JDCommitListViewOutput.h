//
//  JDCommitListViewOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 30/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDCommitListViewOutput <NSObject>

/**
 @author Yury Loginov

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

@end
