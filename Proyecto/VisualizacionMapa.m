//
//  VisualizacionMapa.m
//  Proyecto
//
//  Created by Pedro A. Marín Reyes on 22/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "VisualizacionMapa.h"

#import "ConversorUTMLatLong.h"
@implementation VisualizacionMapa
-(id)init{
    if (self = [super init]){}
    return self;
}

-(MKMapView*)VisualizarMapaYPunto:(MKMapView*)map latitud:(NSString*)latitud longitud:(NSString*)longitud titulo:(NSString*)titulo{
    
    ConversorUTMLatLong *conversor=[[ConversorUTMLatLong alloc]init];
    CLLocationCoordinate2D pos =[conversor coordenadasLatitud:latitud coordenadasLongitud:longitud];
    MKCoordinateSpan zoom={0.001,0.001};
    MKCoordinateRegion region={pos,zoom};
    [map setRegion:region];
    MKPointAnnotation *punto=[MKPointAnnotation new];
    [punto setCoordinate:pos];
    [punto setTitle:titulo];
    [map addAnnotation:punto];
    return map;
}
@end
