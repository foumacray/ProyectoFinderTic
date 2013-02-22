
#import "Parser.h"
#import "LimpiarXML.h"

@implementation Parser

-(void)entradas:(NSString *)cadena{
    salir=false;
    [self conectar:cadena];
    while (!salir)//fuerzas a que siga ejecutando ostros metodos hasta que se cambie la condicion del bucle
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{
    [xmlData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection{
    //tiene que ser en nsutf8 porque si no no muestra nada
    NSMutableString    *contenidoURL = [[NSMutableString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    LimpiarXML *limpieza = [[LimpiarXML alloc] init:contenidoURL];
    [limpieza limpiar];
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

-(void)conectar:(NSString*)cadenaURL{
    xmlData=[NSMutableData new];
    //conectar con la web
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:cadenaURL]];
    conexiones = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:true];
}

@end
