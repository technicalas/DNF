//
//  CalculetteViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculetteViewController : UIViewController<UITextFieldDelegate> {
    UILabel *lblTotal;
    UITextField *txtCigarettesPerJour;
    UITextField *txtPaquetDesCigarettes;
}

@property (nonatomic, retain) IBOutlet UITextField *txtCigarettesPerJour;
@property (nonatomic, retain) IBOutlet UITextField *txtPaquetDesCigarettes;
@property (nonatomic, retain) IBOutlet UILabel *lblTotal;

@end
