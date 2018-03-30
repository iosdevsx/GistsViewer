//
//  JDGistsListInteractor.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListInteractor.h"
#import "JDGistsListInteractorOutput.h"
#import "JDGistsService.h"
#import "GistsListResponseObject.h"
#import "JDOwner.h"
#import "JDUsersService.h"

@implementation JDGistsListInteractor

#pragma mark - Методы JDGistsListInteractorInput

- (void)fetchGists {
    [self preparePublicGistsIsCached:YES];
}

- (void)fetchFreshGists {
    [self preparePublicGistsIsCached:NO];
}

- (void)fetchGistsForUser:(JDOwner *)user {
    [self prepareGistsRequestForUser:user isCached:YES];
}

- (void)fetchFreshGistsForUser:(JDOwner *)user {
    [self prepareGistsRequestForUser:user isCached:NO];
}

#pragma mark - Private

- (void)prepareGistsRequestForUser:(JDOwner *)user isCached:(BOOL)isCached {
    NSLog(@"LOGGING GISTS FETCHING FOR USER %@", user.login);
    NSLog(@"FETCH REQUEST IS CACHED - %d", isCached);
    
    [self.usersService fetchGistsForUser:user isCached:isCached success:^(GistsListResponseObject *response) {
        [self.output gistsFetched:response.gists isCached:isCached];
    } failure:^(NSError *error) {
        [self.output gistsFetchFailedWithError:error];
    }];
}

- (void)preparePublicGistsIsCached:(BOOL)isCached {
    NSLog(@"LOGGING PUBLIC GISTS FETCHING");
    NSLog(@"FETCH REQUEST IS CACHED - %d", isCached);
    [self.gistsService getPublicGistsIsCached:isCached success:^(GistsListResponseObject *response) {
        [self.output gistsFetched:response.gists isCached:isCached];
    } failure:^(NSError *error) {
        [self.output gistsFetchFailedWithError:error];
    }];
}


@end
