//
//  DetalleViewController.h
//  Proyecto
//
//  Created by Alumno 6 on 08/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "ComponentesXML.h"
@interface Detalle : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UILabel *titulo;
@property (weak, nonatomic) IBOutlet UITextView *descripcion;
@property (weak, nonatomic) IBOutlet UILabel *inicio;
@property (weak, nonatomic) IBOutlet UILabel *fin;
@property (weak, nonatomic) IBOutlet UILabel *latitud;
@property (weak, nonatomic) IBOutlet UILabel *longitud;

@property (nonatomic, retain)  NSMutableArray *arrayDetalle;
@end
