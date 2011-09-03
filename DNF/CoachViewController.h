//
//  CoachViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@interface CoachViewController : UIViewController<UIAlertViewDelegate, FBSessionDelegate, FBRequestDelegate, FBDialogDelegate>
{
    Facebook *_facebook;
    UISwitch *switchFB;
}

@property (nonatomic, retain) IBOutlet UISwitch *switchFB;
@property (nonatomic, assign) Facebook *facebook;
- (IBAction)publishOnFacebook:(id)sender;
- (IBAction)activateFacebook:(id)sender;

@end
