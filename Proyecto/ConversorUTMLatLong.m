
#import "ConversorUTMLatLong.h"

@implementation ConversorUTMLatLong
-(id)init{
    if(self= [super init]){}
    return self;
}

- (CLLocationCoordinate2D)coordenadasLatitud:(NSString *)latitud coordenadasLongitud:(NSString *)longitud{
    double cordLongitud = [longitud doubleValue];
    double cordLatitud = [latitud doubleValue];
    double const UTM=30;
    double const C=6399593.626;
    double const Ee=0.006739497;
    double const PI=3.141592654;
    float mericentral = (6*UTM-183); 
    float FI = (cordLongitud/(6366197.724*0.9996)); 
    float NI = (C/pow(1+Ee*pow(cosf(FI), 2), 0.500))*0.9996;
    float a = (cordLatitud - 500000)/NI;
    float A1 = sinf(2*FI);
    float A2 = A1*pow(cosf(FI), 2); 
    float J2 = FI+(A1/2); 
    float J4 = (3*J2+A2)/4; 
    float J6 = (5*J4+A2*(pow(cosf(FI), 2)))/3; 
    float Alfa = (Ee*3)/4; 
    float Beta =((5)*pow(Alfa, 2))/3; 
    float Gama = (35)*pow(Alfa, 3)/27; 
    double Zeta = pow((Ee*pow(a, 2))*0.500*cosf(FI), 2);
    double Eta = (cordLongitud-0.9996*C*(-(Alfa*J2)+(Beta*J6)-(Gama*A1)+FI))/NI*(1-Zeta)+FI;
    double DeltaLambda = atanf(((expf(a*(1-(Zeta/3)))-expf(-a*(1-(Zeta/3))))/2)/cosf(Eta)); 
    double Tau = atanf(cosf(DeltaLambda)*tanf(Eta));
    float LongitudFinalY = +((DeltaLambda/PI)*180+mericentral)-0.001151;//-;
   
    float LatitudFinalX = +((FI+(1+(Ee*(pow(cosf(FI), 2)))-(1.500)*Ee*sinf(FI)*cosf(FI)*(Tau-FI))*(Tau-FI))/PI)*180;;
    NSLog(@"%f",LatitudFinalX);
     NSLog(@"%f",LongitudFinalY);
    CLLocationCoordinate2D coordenadasFinal = {.latitude=LatitudFinalX, .longitude=LongitudFinalY};
    return coordenadasFinal;
}

@end
