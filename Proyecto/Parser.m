//
//  Parser.m
//  Parser
//
//  Created by Alumno 6 on 14/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "Parser.h"
#import "LimpiarXML.h"
@implementation Parser
-(void)entradas:(NSString *)cadena{
    salir=false;
    xmlData=[NSMutableData new];
    //conectar con la web
    NSURL *url=[NSURL URLWithString:cadena];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    conexiones = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:true];
    while (!salir) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]; //fuerzas a que siga ejecutando ostros metodos hasta que se cambie la condicion del bucle
    }
    
}
-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{
    [xmlData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection*)connection{
    //tiene que ser en nsutf8 porque si no no muestra nada
    NSMutableString    *resultado = [[NSMutableString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    
    LimpiarXML *limpieza = [[LimpiarXML alloc] init:resultado];
    NSMutableString *limpia=[limpieza limpiar];
    componentes=[limpieza getComponentes];
    salir=true;
 
    }
-(void) connection:(NSURLConnection*)connection didFailWithError:(NSError *)error{
    xmlData=nil;
    connection=nil;
    NSString *error1 = [NSString stringWithFormat:@"error %@",[error description]];
    UIAlertView *alerta=[[UIAlertView alloc]initWithTitle:@"hay un error" message:error1 delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alerta show];
}
-(NSString *)getString{
    return   [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];

}
-(ComponentesXML *)getComponentes{
    return componentes;
}
@end
