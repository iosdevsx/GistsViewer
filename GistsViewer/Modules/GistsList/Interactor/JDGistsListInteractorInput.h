//
//  JDGistsListInteractorInput.h
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JDOwner;

@protocol JDGistsListInteractorInput <NSObject>

- (void)fetchGists;
- (void)fetchFreshGists;

- (void)fetchGistsForUser:(JDOwner *)user;
- (void)fetchFreshGistsForUser:(JDOwner *)user;

@end
