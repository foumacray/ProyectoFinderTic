
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ConversorUTMLatLong : NSObject

-(id)init;
- (CLLocationCoordinate2D)coordenadasLatitud:(NSString *)latitud coordenadasLongitud:(NSString *)longitud;

@end
