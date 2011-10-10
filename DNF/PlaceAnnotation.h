//
//  PlaceAnnotation.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Place.h"

@interface PlaceAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D _coordinate;
    NSString *_title;
    NSString *_subtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) Place *place;

- (id)initWithTitle:(NSString *)title
           subtitle:(NSString *)subtitle 
         coordinate:(CLLocationCoordinate2D)coordinate;

@end
