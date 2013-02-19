//
//  Parser.h
//  Parser
//
//  Created by Alumno 6 on 14/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComponentesXML.h"
@interface Parser : NSObject{
    NSURLConnection *conexiones;
    NSMutableData *xmlData;
    NSMutableString *cadenaURL;
    bool salir;
    ComponentesXML *componentes;

}
-(void) entradas:(NSString *)cadena;
-(NSString*) getString;
-(ComponentesXML*) getComponentes;
@end
