//
//  MapViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 06/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <RestKit/RestKit.h>
#import "DNFObjectManager.h"

@interface MapViewController : UIViewController<MKMapViewDelegate, RKObjectLoaderDelegate, RKRequestDelegate, UISearchBarDelegate>
{
    MKMapView *_mapView;
    DNFObjectManager *_manager;
    BOOL CPSearch;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) DNFObjectManager *manager;

- (RKObjectLoader *)loadPlaces;
- (RKObjectLoader *)loadPlacesWithCP:(NSString *)cp;

@end
