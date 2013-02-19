//
//  LimpiarXML.m
//  Proyecto
//
//  Created by Alumno 6 on 14/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "ComponentesXML.h"
#import "Parser.h"

@implementation ComponentesXML
- (id)init{
    if (self = [super init]){
    titulo= [NSMutableArray new];
    inicio=[NSMutableArray new];
    fin=[NSMutableArray new];
    descripcion=[NSMutableArray new];
    fechaPublicacion=[NSMutableArray new];
    localizacion=[NSMutableArray new];
    }
    return self;
}
- (void)anadirElemento:(NSString *)cadena array:(NSString *)ristra{
    if ([ristra isEqualToString:@"titulo"]) {
        [titulo addObject:cadena];
    }
    if ([ristra isEqualToString:@"inicio"]) {
        [inicio addObject:cadena];
    }
    if ([ristra isEqualToString:@"fin"]) {
        [fin addObject:cadena];
    }
    if ([ristra isEqualToString:@"descripcion"]) {
        [descripcion addObject:cadena];
    }
    if ([ristra isEqualToString:@"fechaPublicacion"]) {
        NSString *ristraTratada = [[NSString alloc]initWithString:[cadena substringToIndex:10]];
        [fechaPublicacion addObject:ristraTratada];
    }
    if ([ristra isEqualToString:@"localizacion"]) {
        [localizacion addObject:cadena];
    }
}
-(NSMutableArray*) getTitulo{
    return titulo;
}
-(NSMutableArray*) getInicio{
    return inicio;
}
-(NSMutableArray*) getFin{
    return fin;
}
-(NSMutableArray*) getDescripcion{
    return descripcion;
}
-(NSMutableArray *)getFechaPublicacion{
    return fechaPublicacion;
}
-(NSMutableArray *)getLocalizacion{
    return localizacion;
}
@end
