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
    
    
    
    CLLocationCoordinate2D pos ={28, -15};
    MKCoordinateSpan zoom={10,10};
    
    MKCoordinateRegion region={pos,zoom};
    
    [_mapa setRegion:region];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
