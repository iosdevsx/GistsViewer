//
//  JDFilesListRouterInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JDFile;

@protocol JDFilesListRouterInput <NSObject>

- (void)openFileModuleWithFile:(JDFile *)file;

@end
