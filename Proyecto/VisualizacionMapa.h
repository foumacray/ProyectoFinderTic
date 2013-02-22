//
//  VisualizacionMapa.h
//  Proyecto
//
//  Created by Pedro A. Marín Reyes on 22/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface VisualizacionMapa : NSObject
-(id)init;
-(MKMapView*)VisualizarMapaYPunto:(MKMapView*)map latitud:(NSString*)latitud longitud:(NSString*)longitud titulo:(NSString*)titulo;
@end
