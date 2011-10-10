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
    UILabel *currentDate;
    UILabel *dateLabel;
    UILabel *elapsedDaysLabel;
    UISwitch *switchFB;
}

@property (nonatomic, retain) IBOutlet UISwitch *switchFB;
@property (nonatomic, assign) Facebook *facebook;
@property (nonatomic, retain) IBOutlet UILabel *currentDate;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *elapsedDaysLabel;
- (IBAction)publishOnFacebook:(id)sender;
- (IBAction)activateFacebook:(id)sender;

@end
