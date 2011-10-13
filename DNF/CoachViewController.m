//
//  CoachViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoachViewController.h"
#import "DNFAppDelegate.h"
#import "MBProgressHUD.h"
#import "InformationManager.h"
#import "AppConfig.h"

@implementation CoachViewController
@synthesize switchFB;
@synthesize facebook;
@synthesize currentDate;
@synthesize dateLabel;
@synthesize elapsedDaysLabel;

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
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Le Coach";
    
    DNFAppDelegate *delegate = (DNFAppDelegate *) [UIApplication sharedApplication].delegate;
    self.facebook = delegate.facebook; // Assign, no retain
    self.facebook.sessionDelegate = self;
    self.elapsedDaysLabel.text = [InformationManager daysElapsed];
    self.dateLabel.text = [InformationManager currentDate];
    
    UITextField *txtPrice = (UITextField *) [self.view viewWithTag:12];
    txtPrice.keyboardType = UIKeyboardTypeDecimalPad;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self.facebook isSessionValid]) {
        [self.switchFB setOn:YES animated:NO];
    }else{
        [self.switchFB setOn:NO animated:NO];
    }
}

- (void)viewDidUnload
{
    [self setSwitchFB:nil];
    [self setCurrentDate:nil];
    [self setDateLabel:nil];
    [self setElapsedDaysLabel:nil];
    [super viewDidUnload];
    self.facebook.sessionDelegate = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - FBSessionDelegate
/**
 * Called when the user successfully logged in.
 */
- (void)fbDidLogin
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self.facebook accessToken] forKey:FBAccessTokenKey];
    [defaults setObject:[self.facebook expirationDate] forKey:FBExpirationDateKey];
    [defaults setObject:[NSDate date] forKey:kLoginDate];
    [defaults synchronize];
    
    [self.switchFB setOn:YES animated:YES];
    //[self.facebook requestWithGraphPath:@"me" andDelegate:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/**
 * Called when the user dismissed the dialog without logging in.
 */
- (void)fbDidNotLogin:(BOOL)cancelled
{
    [self.switchFB setOn:NO animated:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/**
 * Called when the user logged out.
 */
- (void)fbDidLogout
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:FBAccessTokenKey];
    [defaults removeObjectForKey:FBExpirationDateKey];
    [defaults removeObjectForKey:kLoginDate];
    [defaults synchronize];
    
    [self.switchFB setOn:NO animated:YES];
}

#pragma mark - FBRequestDelegate
/**
 * Called just before the request is sent to the server.
 */
- (void)requestLoading:(FBRequest *)request
{
    NSLog(@"Enviando request");
}

/**
 * Called when an error prevents the request from completing successfully.
 */
- (void)request:(FBRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"Ha ocurrido un error :%@", error);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

/**
 * Called when a request returns and its response has been parsed into
 * an object.
 *
 * The resulting object may be a dictionary, an array, a string, or a number,
 * depending on thee format of the API response.
 */
- (void)request:(FBRequest *)request didLoad:(id)result
{
    if ([result isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Recibi un NSDictionary %@", (NSDictionary *) result);
    }else if ([result isKindOfClass:[NSArray class]]) {
        NSLog(@"Recibi un NSArray %@", (NSArray *) result);
    }else if ([result isKindOfClass:[NSString class]]) {
        NSLog(@"Recibi un NSString %@", (NSString *) result);
    }else if ([result isKindOfClass:[NSNumber class]]) {
        NSLog(@"Recibi un NSNumber %@", (NSNumber *) result);
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - Actions methods

- (IBAction)publishOnFacebook:(id)sender {
    if (self.switchFB.isOn && self.facebook.isSessionValid) {
        NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       //appIDFB, @"app_id",
                                       @"http://dnf.asso.fr/", @"link",
                                       @"http://dnf.asso.fr/css/dnf.png", @"picture",
                                       @"DNF", @"name",
                                       @"Esta es la informacion que se publicara en FB?", @"caption",
                                       @"Aplicacion DNF", @"description",
                                       nil];
        [self.facebook dialog:@"feed" andParams:params andDelegate:self];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                        message:@"You must register a Facebook account first" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

- (IBAction)activateFacebook:(id)sender {
    UISwitch *aSwitch = (UISwitch*) sender;
    if (aSwitch.on){
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSArray *permissions = [NSArray arrayWithObjects:@"user_about_me", @"publish_stream", nil];
        [self.facebook authorize:permissions];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta" message:@"¿Esta seguro que desea cerrar la cuenta de Facebook?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Aceptar", nil];
        [alert show];
        [alert release];
    }
}

- (void)dealloc {
    [switchFB release];
    [currentDate release];
    [dateLabel release];
    [elapsedDaysLabel release];
    [super dealloc];
}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0: // Cancel
            [self.switchFB setOn:YES animated:NO];
            break;
        case 1: // OK
            [self.facebook logout:self];
            break;
        default:
            break;
    }
}

@end
