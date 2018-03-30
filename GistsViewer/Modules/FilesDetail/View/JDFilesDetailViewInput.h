//
//  JDFilesDetailViewInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 29/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDFilesDetailViewInput <NSObject>

- (void)setupInitialStateWithContent:(NSString *)content;

@end
