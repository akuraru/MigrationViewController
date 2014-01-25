//
//  AppDelegate.m
//  TableViewAgent
//
//  Created by P.I.akura on 2013/06/15.
//  Copyright (c) 2013年 P.I.akura. All rights reserved.
//

#import "AppDelegate.h"
#import "MigrationViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MigrationViewController setUpWithWindow:self.window];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
