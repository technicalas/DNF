//
//  PlaceAnnotationView.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 30/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlaceAnnotationView.h"

@implementation PlaceAnnotationView

- (void)setImageWithURL:(NSURL *)url
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    UIImage *cachedImage = [manager imageWithURL:url];
    if (cachedImage){
        self.image = [cachedImage copy];
    }else{
        [manager downloadWithURL:url delegate:self];
    }
}

- (void)webImageManager:(SDWebImageManager *)imageManager 
     didFinishWithImage:(UIImage *)image
{
    self.image = image;
}

@end
