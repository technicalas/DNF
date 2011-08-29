//
//  DNFAppDelegate.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "FBConnect.h"

@interface DNFAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>
{
    Facebook *_facebook;
=======
#import "Facebook.h"


@interface DNFAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, FBSessionDelegate>
{
    Facebook *facebook;
>>>>>>> Commit Obligatorio que me pide
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain) Facebook *facebook;

<<<<<<< HEAD
=======
//APP ID FACEBOOK 247552555285262




>>>>>>> Commit Obligatorio que me pide
@end
