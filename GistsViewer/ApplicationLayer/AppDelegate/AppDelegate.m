//
//  AppDelegate.m
//  GistsViewer
//
//  Created by Yury Loginov on 16.03.2018.
//  Copyright © 2018 Yury Loginov. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>

static NSString *const kDatabaseName = @"Gists";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStackWithStoreNamed:kDatabaseName];
    [self.window makeKeyAndVisible];
    [self.appCoordinator start];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}


@end
