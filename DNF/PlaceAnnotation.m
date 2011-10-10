//
//  PlaceAnnotation.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlaceAnnotation.h"

@implementation PlaceAnnotation
@synthesize coordinate = _coordinate;
@synthesize place;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (id)initWithTitle:(NSString *)title 
           subtitle:(NSString *)subtitle 
         coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _subtitle = [subtitle copy];
        _coordinate = coordinate;
    }
    return self;
}

- (NSString *)title
{
    return _title;
}

- (NSString *)subtitle
{
    return _subtitle;
}

@end
