
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface VisualizacionMapa : NSObject

-(id)init;
-(MKMapView*)VisualizarMapaYPunto:(MKMapView*)mapa latitud:(NSString*)latitud longitud:(NSString*)longitud titulo:(NSString*)titulo;

@end
