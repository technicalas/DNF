//
//  CalculetteViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculetteViewController.h"

@implementation CalculetteViewController
@synthesize txtCigarettesPerJour;
@synthesize txtPaquetDesCigarettes;
@synthesize lblTotal;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)calculateValues
{
    float a = [self.txtCigarettesPerJour.text floatValue];
    float b = [self.txtPaquetDesCigarettes.text floatValue];
    float c = a*b;
    
    NSString *result = [NSString stringWithFormat:@"%.2f €", c];
    lblTotal.text = result;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtPaquetDesCigarettes.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(calculateValues)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidUnload
{
    [self setLblTotal:nil];
    [self setTxtCigarettesPerJour:nil];
    [self setTxtPaquetDesCigarettes:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [lblTotal release];
    [txtCigarettesPerJour release];
    [txtPaquetDesCigarettes release];
    [super dealloc];
}

@end
