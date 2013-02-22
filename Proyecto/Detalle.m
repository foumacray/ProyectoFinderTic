//
//  Detalle.m
//  Proyecto
//
//  Created by Alumno 6 on 08/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "Detalle.h"
@interface Detalle ()

@end

@implementation Detalle
@synthesize scroll=_scroll;
@synthesize mapa=_mapa;
@synthesize titulo=_titulo;
@synthesize descripcion=_descripcion;
@synthesize inicio=_inicio;
@synthesize fin=_fin;
@synthesize latitud=_latitud;
@synthesize longitud=_longitud;
@synthesize arrayDetalle=_arrayDetalle;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _scroll.contentSize=CGSizeMake(320, 760);
    
        _titulo.text=[_arrayDetalle objectAtIndex:0];
    _descripcion.text=[_arrayDetalle objectAtIndex:1];
    _inicio.text=[_arrayDetalle objectAtIndex:2];
    _fin.text=[_arrayDetalle objectAtIndex:3];
    _longitud.text=[[self separarCoordenadas:[_arrayDetalle objectAtIndex:4]] objectAtIndex:0];
    _latitud.text=[[self separarCoordenadas:[_arrayDetalle objectAtIndex:4]] objectAtIndex:1];
    CLLocationCoordinate2D pos =[self coordenadasLatitud:_latitud.text coordenadasLongitud:_longitud.text];
    MKCoordinateSpan zoom={0.001,0.001};
    MKCoordinateRegion region={pos,zoom};
    [_mapa setRegion:region];
    MKPointAnnotation *punto=[MKPointAnnotation new];
    [punto setCoordinate:pos];
    [punto setTitle:_titulo.text];
    [_mapa addAnnotation:punto];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray*)separarCoordenadas:(NSString*)coordenadasJuntas{
    // NSRange incidencia = [coordenadasJuntas rangeOfString:@" "];
    NSMutableArray *miArray=[NSMutableArray new];

    [miArray addObject:[coordenadasJuntas substringToIndex:[coordenadasJuntas rangeOfString:@" "].location-1]];
    [miArray addObject:[coordenadasJuntas substringFromIndex:[coordenadasJuntas rangeOfString:@" "].location+1]];
    return miArray;
}
- (CLLocationCoordinate2D)coordenadasLatitud:(NSString *)latitud coordenadasLongitud:(NSString *)longitud
{
    double cordLongitud = [longitud doubleValue];
    double cordLatitud = [latitud doubleValue];
    
    double UTM=30;
    double C=6371000;
    double Ee=0.006739497;
    double PI=3.14159265359;
    float mericentral = (6*UTM-183); // Usamo el UTM =30, es la region cuadriculada de Zaragoza.
    double surEcuador = cordLongitud;
    float FI = (surEcuador/(6366197.724*0.9996)); // Bien
    float var3 = pow(cosf(FI), 2);
    float var2 = pow(1+Ee*var3, 0.500);
    float NI = (C/var2)*0.9996; // Bien
    float a = (cordLatitud - 500000)/NI; // Bien
    float A1 = sinf(2*FI); // Bien
    float A2 = A1*pow(cosf(FI), 2); // Bien
    float J2 = FI+(A1/2); // Bien
    float J4 = (3*J2+A2)/4; // Bien
    float J6 = (5*J4+A2*(pow(cosf(FI), 2)))/3; // Bien
    float Alfa = (Ee*3)/4; // Bien
    float Beta =((5)*pow(Alfa, 2))/3; // Bien
    float Gama = (35)*pow(Alfa, 3)/27; // Bien
    double var6 = 0.9996*C;
    double var7 = -(Alfa*J2)+(Beta*J6)-(Gama*A1);
    double Bfi = var6*(var7+FI); //Mal
    float b = (surEcuador-Bfi)/NI;
    double var = pow(a, 2);
    double var4 = (Ee*var)*0.500;
    double var5 = var4*cosf(FI);
    double Zeta = pow(var5, 2);
    double Xi = a*(1-(Zeta/3)); // Bien
    double Eta = b*(1-Zeta)+FI; // Bien
    double SenhXi = (expf(Xi)-expf(-Xi))/2; // Bien
    double DeltaLambda = atanf(SenhXi/cosf(Eta)); // Bien
    double Tau = atanf(cosf(DeltaLambda)*tanf(Eta));
    float var9 = pow(cosf(FI), 2);
    float Frad = FI+(1+(Ee*(var9))-(1.500)*Ee*sinf(FI)*cosf(FI)*(Tau-FI))*(Tau-FI);
    float LongitudFinalY = +(DeltaLambda/PI)*180+mericentral;
    // Correción De valores, debido al excedente de decimales de float y double, afecta sobre todo al eje Y.
    LongitudFinalY = LongitudFinalY - 0.016781;
    
    NSLog(@"Cordenada Y = %f",LongitudFinalY);
    float LatitudFinalX = +(Frad/PI)*180;
    NSLog(@"Cordenada X = %f",LatitudFinalX);
    LatitudFinalX-=0.186159;
    CLLocationCoordinate2D coordenadasFinal = {.latitude=LatitudFinalX, .longitude=LongitudFinalY};
    return coordenadasFinal;
}

@end
