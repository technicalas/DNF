//
//  MoviePlayerViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 12/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MoviePlayerViewController.h"

@implementation MoviePlayerViewController

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
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"dnfvideo" ofType:@"mp4"];
    
    NSURL *url = [NSURL fileURLWithPath:resourcePath];
    
    MPMoviePlayerController *playerController = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [playerController.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+20, self.view.frame.size.width, self.view.frame.size.height)];
    
    [self.view addSubview:playerController.view];
    
    //playerController.fullscreen = YES;
    [playerController play];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
