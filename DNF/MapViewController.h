//
//  MapViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 06/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *mapView;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
