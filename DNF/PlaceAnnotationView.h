//
//  PlaceAnnotationView.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 30/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "SDWebImageManager.h"

@interface PlaceAnnotationView : MKAnnotationView<SDWebImageManagerDelegate>

- (void)setImageWithURL:(NSURL *)url;

@end
