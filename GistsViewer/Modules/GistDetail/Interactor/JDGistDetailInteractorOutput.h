//
//  JDGistDetailInteractorOutput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol JDGistDetailInteractorOutput <NSObject>

- (void)commitsFetched:(NSArray *)commits;
- (void)commitsFetchFailed:(NSString *)error;

- (void)filesFetched:(NSArray *)files;
- (void)filesFetchFailed:(NSString *)error;

@end
