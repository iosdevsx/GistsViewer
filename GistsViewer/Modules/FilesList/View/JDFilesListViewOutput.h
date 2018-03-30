//
//  JDFilesListViewOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDFilesListViewOutput <NSObject>

- (void)didTriggerViewReadyEvent;
- (void)handleFileTapAtIndex:(NSInteger)index;

@end
