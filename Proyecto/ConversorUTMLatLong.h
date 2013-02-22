//
//  ConversorUTMLatLong.h
//  Proyecto
//
//  Created by Pedro A. Marín Reyes on 22/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface ConversorUTMLatLong : NSObject
-(id)init;
- (CLLocationCoordinate2D)coordenadasLatitud:(NSString *)latitud coordenadasLongitud:(NSString *)longitud;
@end
