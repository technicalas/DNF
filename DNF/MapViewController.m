//
//  MapViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 06/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "DNFObjectManager.h"
#import "Place.h"
#import "PlaceAnnotation.h"
#import "PlaceAnnotationView.h"

@interface MapViewController (ObjectMapping)
- (void)configureMapping;
- (RKObjectMapping *)objectMappingForPlace;
@end

@implementation MapViewController
@synthesize mapView = _mapView;
@synthesize manager = _manager;

NSString *const BASE_URL = @"http://soplo-digital.com/webdnf";
NSString *const PLACES_REQUEST = @"getcafes.php";
NSString *const IMAGES_URL = @"images";

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [_manager release];
    [_mapView release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Places";
    // Do any additional setup after loading the view from its nib.
    
    if (self.mapView.userLocation) {
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.location.coordinate, 1000, 1000);
        MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];                
        [self.mapView setRegion:adjustedRegion animated:YES];
    }
    
    DNFObjectManager *manager = (DNFObjectManager *) [DNFObjectManager objectManagerWithBaseURL:BASE_URL];
    self.manager = manager;
    [self configureMapping];
    [self loadPlaces];
}

- (void)viewDidUnload
{
    [self setManager:nil];
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

#pragma mark - Annotations management
- (void)updateAnnotationsWithPlaces:(NSArray *)places
{
    // Remove all annotations
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    if (places.count > 0) {
        CLLocationCoordinate2D lastCoordinate;
        // Add new annotations
        for (Place *place in places) {
            float latitude = [place.latitud floatValue];
            float longitude = [place.longitude floatValue];
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
            PlaceAnnotation *annotation = [[[PlaceAnnotation alloc] initWithTitle:place.nombre
                                                                         subtitle:place.direccion
                                                                       coordinate:coordinate] autorelease];
            annotation.place = place;
            [self.mapView addAnnotation:annotation];
            lastCoordinate = coordinate;
        }
        if (CPSearch) {
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(lastCoordinate, 100, 100);
            MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
            [self.mapView setRegion:adjustedRegion animated:YES];
        }
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Places" 
                                                        message:@"There aren't places nearby" 
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    if (CPSearch) {
        CPSearch = NO;
    }
}

#pragma mark - Object mapping
- (void)configureMapping
{
    RKObjectMapping *placeMapping = [self objectMappingForPlace];
    [self.manager.mappingProvider setMapping:placeMapping
                                  forKeyPath:@"cafes"];
}

- (RKObjectMapping *)objectMappingForPlace
{
    RKObjectMapping *placeMapping = [RKObjectMapping mappingForClass:[Place class]];
    [placeMapping mapKeyPath:@"id_cafe" toAttribute:@"id_cafe"];
    [placeMapping mapKeyPath:@"nombre" toAttribute:@"nombre"];
    [placeMapping mapKeyPath:@"direccion" toAttribute:@"direccion"];
    [placeMapping mapKeyPath:@"telefono" toAttribute:@"telefono"];
    [placeMapping mapKeyPath:@"codigo_postal" toAttribute:@"codigo_postal"];
    [placeMapping mapKeyPath:@"url" toAttribute:@"url"];
    [placeMapping mapKeyPath:@"descripcion" toAttribute:@"descripcion"];
    [placeMapping mapKeyPath:@"imagen" toAttribute:@"imagen"];
    [placeMapping mapKeyPath:@"latitud" toAttribute:@"latitud"];
    [placeMapping mapKeyPath:@"longitude" toAttribute:@"longitude"];
    [placeMapping mapKeyPath:@"ping" toAttribute:@"ping"];
    return placeMapping;
}

#pragma mark - RKObjectLoaderDelegate
- (void)objectLoader:(RKObjectLoader *)objectLoader 
      didLoadObjects:(NSArray *)objects
{
    if ([objectLoader wasSentToResourcePath:PLACES_REQUEST]) {
        [self updateAnnotationsWithPlaces:objects];
    }
}

- (void)objectLoader:(RKObjectLoader *)objectLoader 
    didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                    message:@"There was a problem loading the data" 
                                                   delegate:nil
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark - Load data
- (RKObjectLoader *)loadPlacesWithCP:(NSString *)cp
{
    NSDictionary *params = [NSDictionary dictionaryWithObject:cp forKey:@"cp"];
    return [self.manager loadObjectsAtResourcePath:PLACES_REQUEST withParameters:params delegate:self];
}

- (RKObjectLoader *)loadPlaces
{
    return [self loadPlacesWithCP:@""];
}

#pragma mark - MKMapViewDelegate
- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 1000, 1000);
    MKCoordinateRegion adjustedRegion = [aMapView regionThatFits:viewRegion];                
    [aMapView setRegion:adjustedRegion animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *placeAnnotationID = @"placeAnnotation";
    PlaceAnnotationView *annotationView = nil;
    
    if ([annotation isKindOfClass:[PlaceAnnotation class]]) {
        PlaceAnnotation *placeAnnotation = (PlaceAnnotation *)annotation;
        annotationView = (PlaceAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:placeAnnotationID];
        if (annotationView == nil) {
            annotationView = [[[PlaceAnnotationView alloc] initWithAnnotation:annotation 
                                                             reuseIdentifier:placeAnnotationID] autorelease];
        }else{
            annotationView.annotation = annotation;
        }
        annotationView.canShowCallout = YES;
        NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@", BASE_URL, IMAGES_URL, placeAnnotation.place.ping];
        NSURL *url = [NSURL URLWithString:urlString];
        [annotationView setImageWithURL:url];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annotationView.rightCalloutAccessoryView = button;
        
        /*
        UIImageView *imagen = [[[UIImageView alloc] initWithImage:annotationView.image] autorelease];
        annotationView.leftCalloutAccessoryView = imagen;
         */
    }
    
    return annotationView;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self loadPlacesWithCP:searchBar.text];
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    CPSearch = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
    CPSearch = NO;
}

@end
