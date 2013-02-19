//
//  LimpiarXML.h
//  Proyecto
//
//  Created by Alumno 6 on 15/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComponentesXML.h"
@interface LimpiarXML : NSObject{
    NSMutableString *miRistra;
    ComponentesXML *componentes;
}
-(NSMutableString *)limpiar;
-(id) init:(NSString*)ristra;
-(ComponentesXML*) getComponentes;
@end
