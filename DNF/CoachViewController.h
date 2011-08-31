//
//  CoachViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface CoachViewController : UIViewController<FBSessionDelegate, FBRequestDelegate>
{
    Facebook *_facebook;
    UISwitch *switchFB;
}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
@property (nonatomic, retain) IBOutlet UISwitch *switchFB;
>>>>>>> Added HUD
=======
>>>>>>> parent of 1264b35... Commit Obligatorio que me pide
=======
>>>>>>> parent of 1264b35... Commit Obligatorio que me pide
@property (nonatomic, assign) Facebook *facebook;
- (IBAction)publishOnFacebook:(id)sender;
- (IBAction)activateFacebook:(id)sender;

@end
