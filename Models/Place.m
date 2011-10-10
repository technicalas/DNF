//
//  Place.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 25/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Place.h"

@implementation Place

@synthesize id_cafe, nombre, direccion, telefono, codigo_postal, url, descripcion, imagen, latitud, longitude, ping;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
