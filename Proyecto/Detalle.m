//
//  Detalle.m
//  Proyecto
//
//  Created by Alumno 6 on 08/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "Detalle.h"
#import "VisualizacionMapa.h"
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
    _scroll.contentSize=CGSizeMake(320, 760);
    [self asignarValoresLabels];
    VisualizacionMapa *visualizador = [VisualizacionMapa new];
    _mapa=[visualizador VisualizarMapaYPunto:_mapa latitud:_latitud.text longitud:_longitud.text titulo:_titulo.text];
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
-(void) asignarValoresLabels{
    _titulo.text=[_arrayDetalle objectAtIndex:0];
    _descripcion.text=[_arrayDetalle objectAtIndex:1];
    _inicio.text=[_arrayDetalle objectAtIndex:2];
    _fin.text=[_arrayDetalle objectAtIndex:3];
    _longitud.text=[[self separarCoordenadas:[_arrayDetalle objectAtIndex:4]] objectAtIndex:0];
    _latitud.text=[[self separarCoordenadas:[_arrayDetalle objectAtIndex:4]] objectAtIndex:1];
}
@end
