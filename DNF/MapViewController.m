//
//  MapViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 06/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController
@synthesize mapView;

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
    // Do any additional setup after loading the view from its nib.
    if (self.mapView.userLocation) {
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate, 1000, 1000);
        MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];                
        [mapView setRegion:adjustedRegion animated:YES];
    }
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - MKMapViewDelegate
- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 1000, 1000);
    MKCoordinateRegion adjustedRegion = [aMapView regionThatFits:viewRegion];                
    [aMapView setRegion:adjustedRegion animated:YES];
}

- (void)dealloc {
    [mapView release];
    [super dealloc];
}
@end
