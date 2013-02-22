//
//  ConversorUTMLatLong.m
//  Proyecto
//
//  Created by Pedro A. Marín Reyes on 22/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "ConversorUTMLatLong.h"

@implementation ConversorUTMLatLong
-(id)init{
    if(self= [super init]){}
    return self;
}
- (CLLocationCoordinate2D)coordenadasLatitud:(NSString *)latitud coordenadasLongitud:(NSString *)longitud
{
    double cordLongitud = [longitud doubleValue];
    double cordLatitud = [latitud doubleValue];
    
    double const UTM=30;
    double const C=6371000;
    double const Ee=0.006739497;
    double const PI=3.14159265359;
    
    float mericentral = (6*UTM-183); // Usamo el UTM =30, es la region cuadriculada de Zaragoza.
    float FI = (cordLongitud/(6366197.724*0.9996)); // Bien
    float NI = (C/pow(1+Ee*pow(cosf(FI), 2), 0.500))*0.9996; // Bien
    float a = (cordLatitud - 500000)/NI; // Bien
    float A1 = sinf(2*FI); // Bien
    float A2 = A1*pow(cosf(FI), 2); // Bien
    float J2 = FI+(A1/2); // Bien
    float J4 = (3*J2+A2)/4; // Bien
    float J6 = (5*J4+A2*(pow(cosf(FI), 2)))/3; // Bien
    float Alfa = (Ee*3)/4; // Bien
    float Beta =((5)*pow(Alfa, 2))/3; // Bien
    float Gama = (35)*pow(Alfa, 3)/27; // Bien
    double Zeta = pow((Ee*pow(a, 2))*0.500*cosf(FI), 2);
    double Eta = (cordLongitud-0.9996*C*(-(Alfa*J2)+(Beta*J6)-(Gama*A1)+FI))/NI*(1-Zeta)+FI; // Bien
    double DeltaLambda = atanf(((expf(a*(1-(Zeta/3)))-expf(-a*(1-(Zeta/3))))/2)/cosf(Eta)); // Bien
    double Tau = atanf(cosf(DeltaLambda)*tanf(Eta));
    float LongitudFinalY = +(DeltaLambda/PI)*180+mericentral- 0.016781; // Correción De valores, debido al excedente de decimales de float y double, afecta sobre todo al eje Y.
    float LatitudFinalX = +((FI+(1+(Ee*(pow(cosf(FI), 2)))-(1.500)*Ee*sinf(FI)*cosf(FI)*(Tau-FI))*(Tau-FI))/PI)*180 -0.186159;
    
    NSLog(@"Cordenada Y = %f",LongitudFinalY);
    NSLog(@"Cordenada X = %f",LatitudFinalX);
    
    CLLocationCoordinate2D coordenadasFinal = {.latitude=LatitudFinalX, .longitude=LongitudFinalY};
    return coordenadasFinal;
}

@end
