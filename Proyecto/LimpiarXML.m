
#import "LimpiarXML.h"

@implementation LimpiarXML

- (id)init:(NSMutableString*)ristra{
    if (self = [super init]){
        stringContenido=ristra;
        componentes =[[ComponentesXML alloc]init];
            }
    return self;
}

-(NSMutableString *)limpiar{
    NSString  *modificada;
    NSRange incidencia = [stringContenido rangeOfString:@"<title>"];
    incidencia.location+=7;
    modificada=[[NSString alloc]initWithString:[stringContenido substringFromIndex:incidencia.location] ];
    incidencia= [modificada rangeOfString:@"<title>"];
    incidencia.location+=7;
    modificada=[[NSMutableString alloc]initWithString:[modificada substringFromIndex:incidencia.location] ];
    incidencia= [modificada rangeOfString:@"<title>"];
    incidencia.location+=7;
       while (incidencia.length!=0) {
        //cacho para el titulo
        modificada=[[NSMutableString alloc]initWithString:[modificada substringFromIndex:incidencia.location] ];
        NSRange fin=[modificada rangeOfString:@"</title>"];
        NSMutableString *palabra=[[NSMutableString alloc]initWithString:[modificada substringToIndex:fin.location]];
       
        [componentes anadirElemento:palabra array:@"titulo"];
        
        //cacho para la fecha de inicio
        incidencia= [modificada rangeOfString:@"Inicio&lt;/strong&gt;"];
        incidencia.location+=22;
        modificada=[[NSMutableString alloc]initWithString:[modificada substringFromIndex:incidencia.location] ];
         fin=[modificada rangeOfString:@"&lt;/"];
         palabra=[[NSMutableString alloc]initWithString:[modificada substringToIndex:fin.location]];
        
        [componentes anadirElemento:palabra array:@"inicio"];
        
        //cacho para la fecha de finalizacion
        incidencia= [modificada rangeOfString:@"Finalizaci&amp;oacute;n&lt;/strong&gt;"];
        incidencia.location+=38;
        modificada=[[NSMutableString alloc]initWithString:[modificada substringFromIndex:incidencia.location] ];
        fin=[modificada rangeOfString:@"&lt;/"];
        palabra=[[NSMutableString alloc]initWithString:[modificada substringToIndex:fin.location]];
       
               [componentes anadirElemento:palabra array:@"fin"];
        
        //cacho para la descripción
        incidencia= [modificada rangeOfString:@"Observaciones&lt;/strong&gt;"];
        incidencia.location+=29;
        modificada=[[NSMutableString alloc]initWithString:[modificada substringFromIndex:incidencia.location] ];
        fin=[modificada rangeOfString:@"&lt;/"];
        palabra=[[NSMutableString alloc]initWithString:[modificada substringToIndex:fin.location]];
        
               [componentes anadirElemento:palabra array:@"descripcion"];
        
        //cacho para la fecha publicación
        incidencia= [modificada rangeOfString:@"<dc:date>"];
        incidencia.location+=9;
        modificada=[[NSMutableString alloc]initWithString:[modificada substringFromIndex:incidencia.location] ];
        fin=[modificada rangeOfString:@"Z"];
        palabra=[[NSMutableString alloc]initWithString:[modificada substringToIndex:fin.location]];
        
               [componentes anadirElemento:palabra array:@"fechaPublicacion"];
        
        //cacho para la posición
        incidencia= [modificada rangeOfString:@"<georss:point>"];
        incidencia.location+=14;
        modificada=[[NSMutableString alloc]initWithString:[modificada substringFromIndex:incidencia.location] ];
        fin=[modificada rangeOfString:@"</georss:point>"];
        palabra=[[NSMutableString alloc]initWithString:[modificada substringToIndex:fin.location]];
       
               [componentes anadirElemento:palabra array:@"localizacion"];
        
        incidencia= [modificada rangeOfString:@"<title>"];
        incidencia.location+=7;
    }
        
    return stringContenido;
}

- (ComponentesXML *)getComponentes{
    return componentes;
}


@end
