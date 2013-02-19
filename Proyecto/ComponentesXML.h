//
//  LimpiarXML.h
//  Proyecto
//
//  Created by Alumno 6 on 14/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComponentesXML : NSObject{
    NSMutableArray *titulo;
    NSMutableArray *inicio;
    NSMutableArray *fin;
    NSMutableArray *fechaPublicacion;
    NSMutableArray *descripcion;
    NSMutableArray *localizacion;
   
}
-(id) init;
-(void) anadirElemento: (NSString*)cadena array:(NSString*)ristra;
-(NSMutableArray*) getTitulo;
-(NSMutableArray*) getInicio;
-(NSMutableArray*) getFin;
-(NSMutableArray*) getDescripcion;
-(NSMutableArray*) getFechaPublicacion;
-(NSMutableArray*) getLocalizacion;
@end
