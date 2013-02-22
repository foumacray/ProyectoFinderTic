
#import "VisualizacionMapa.h"
#import "ConversorUTMLatLong.h"

@implementation VisualizacionMapa

-(id)init{
    if (self = [super init]){}
    return self;
}

-(MKMapView*)VisualizarMapaYPunto:(MKMapView*)mapa latitud:(NSString*)latitud longitud:(NSString*)longitud titulo:(NSString*)titulo{
    
    ConversorUTMLatLong *conversor=[ConversorUTMLatLong new];
    CLLocationCoordinate2D posicion =[conversor coordenadasLatitud:latitud coordenadasLongitud:longitud];
    MKCoordinateSpan zoom={0.001,0.001};
    MKCoordinateRegion region={posicion,zoom};
    [mapa setRegion:region];
    MKPointAnnotation *punto=[MKPointAnnotation new];
    [punto setCoordinate:posicion];
    [punto setTitle:titulo];
    [mapa addAnnotation:punto];
    return mapa;
}

@end
