//
//  JDGistsListPresenter.m
//  GistsViewer
//
//  Created by Yury Loginov on 27/03/2018.
//  Copyright © 2018 JD. All rights reserved.
//

#import "JDGistsListPresenter.h"
#import "JDGistsListViewInput.h"
#import "JDGistsListInteractorInput.h"
#import "JDGistsListRouterInput.h"
#import "JDGistsListModuleOutput.h"
#import "JDOwner.h"


@interface JDGistsListPresenter()

@property (nonatomic, weak) id <JDGistsListModuleOutput> output;
@property (nonatomic, strong) JDOwner *user;

@end

@implementation JDGistsListPresenter

#pragma mark - Методы JDGistsListModuleInput

- (void)configureModuleWithOutputPoint:(id <JDGistsListModuleOutput>)output {
    self.output = output;
}

- (void)configureModuleWithUser:(JDOwner *)user {
    self.user = user;
}

- (void)fetchAllPublicGists {
    [self.interactor fetchGists];
}

- (void)fetchAllPublicGistsForUser:(JDOwner *)user {
    [self.interactor fetchGistsForUser:self.user];
}

#pragma mark - Методы JDGistsListViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self fetchGists];
}

- (void)handleUpdateGistsFired {
    [self fetchFreshGists];
}

- (void)handleGistSelected:(JDGist *)gist {
    [self.output gistSelected:gist];
    [self.router openGistDetailModuleWithGist:gist];
}

- (void)handleRetryTap {
    [self.view showLoader];
    [self.view hideStubView];
    [self fetchGists];
}

#pragma mark - Методы JDGistsListInteractorOutput

- (void)gistsFetched:(NSArray *)gists isCached:(BOOL)isCached {
    [self.view hideLoader];
    
    [self.output gistsLoaded:gists isCached:isCached];
    [self.view updateViewWithGists:gists];
    
    if (isCached && gists.count == 0) {
        [self fetchFreshGists];
    }
}

- (void)gistsFetchFailedWithError:(NSError *)error {
    [self.view hideLoader];
    [self.view showError:error.localizedDescription];
    [self.view showStubViewWithError:error.localizedDescription];
}

#pragma mark - Private

- (void)fetchGists {
    if (self.user) {
        [self.interactor fetchGistsForUser:self.user];
    } else {
        [self.interactor fetchGists];
    }
}

- (void)fetchFreshGists {
    [self.view showLoader];
    
    if (self.user) {
        [self.interactor fetchFreshGistsForUser:self.user];
    } else {
        [self.interactor fetchFreshGists];
    }
}

@end
