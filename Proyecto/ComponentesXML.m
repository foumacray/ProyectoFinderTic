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
- (void)anadirElemento:(NSString *)dato array:(NSString *)aQueVector{
    if ([aQueVector isEqualToString:@"titulo"]) {
        [titulo addObject:dato];
    }
    if ([aQueVector isEqualToString:@"inicio"]) {
        [inicio addObject:dato];
    }
    if ([aQueVector isEqualToString:@"fin"]) {
        [fin addObject:dato];
    }
    if ([aQueVector isEqualToString:@"descripcion"]) {
        [descripcion addObject:dato];
    }
    if ([aQueVector isEqualToString:@"fechaPublicacion"]) {
        NSString *ristraTratada = [[NSString alloc]initWithString:[dato substringToIndex:10]];
        [fechaPublicacion addObject:ristraTratada];
    }
    if ([aQueVector isEqualToString:@"localizacion"]) {
        [localizacion addObject:dato];
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
