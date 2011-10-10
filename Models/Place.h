//
//  Place.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 25/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject
{
    NSNumber *id_cafe;
    NSString *nombre;
    NSString *direccion;
    NSString *telefono;
    NSString *codigo_postal;
    NSString *url;
    NSString *descripcion;
    NSString *imagen;
    NSString *ping;
    NSNumber *latitud;
    NSNumber *longitude;
}

@property (nonatomic, retain) NSNumber *id_cafe;
@property (nonatomic, retain) NSString *nombre;
@property (nonatomic, retain) NSString *direccion;
@property (nonatomic, retain) NSString *telefono;
@property (nonatomic, retain) NSString *codigo_postal;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *descripcion;
@property (nonatomic, retain) NSString *imagen;
@property (nonatomic, retain) NSNumber *latitud;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSString *ping;


@end
