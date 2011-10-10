//
//  DNFAppDelegate.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DNFAppDelegate.h"
#import "AppConfig.h"

@implementation DNFAppDelegate
@synthesize facebook = _facebook;
@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [_facebook handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    Facebook *facebook = [[Facebook alloc] initWithAppId:appIDFB andDelegate:nil];
    self.facebook = facebook;
    [facebook release];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:FBAccessTokenKey] 
        && [defaults objectForKey:FBExpirationDateKey]) {
        self.facebook.accessToken = [defaults objectForKey:FBAccessTokenKey];
        self.facebook.expirationDate = [defaults objectForKey:FBExpirationDateKey];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

- (void)dealloc
{
    [_facebook release];
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

@end
