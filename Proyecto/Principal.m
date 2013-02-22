
#import "Principal.h"
#import "Celda.h"
#import "Detalle.h"

@interface Principal ()

@end

@implementation Principal

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor= [UIColor blackColor];
    [self cargarDatos:@"http://www.zaragoza.es/georss/feed?id=3"];
}

- (void) cargarDatos:(NSString*)URL{
    contenidoWeb =[Parser new];
    [contenidoWeb entradas:URL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[contenidoWeb getComponentes] getTitulo] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Celda *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell ==nil)
        cell = [[Celda alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    [self setContenidoCeldas:cell fila:indexPath.row];
    return cell;
}

-(void)setContenidoCeldas:(Celda*)cell fila:(int)fila{
    cell.labelTitulo.text = [[[contenidoWeb getComponentes] getTitulo]objectAtIndex:fila];
    cell.labelFechaBoton.text = [[[contenidoWeb getComponentes] getFechaPublicacion]objectAtIndex:fila];
    cell.labelFecha.text = [[[contenidoWeb getComponentes] getInicio]objectAtIndex:fila];
    cell.labelfinfecha.text = [[[contenidoWeb getComponentes] getFin]objectAtIndex:fila];
    cell.labelobservaciones.text = [[[contenidoWeb getComponentes] getDescripcion]objectAtIndex:fila];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"aDetalle"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Detalle *detalle = [segue destinationViewController];
        detalle.arrayDetalle=[[NSMutableArray alloc]init];
        [self anadirElementosAArrayDestino:detalle.arrayDetalle fila:indexPath.row];
    }
   }

-(void)anadirElementosAArrayDestino:(NSMutableArray*)arrayDetalle fila:(int)fila{
    [arrayDetalle addObject:[[[contenidoWeb getComponentes]getTitulo] objectAtIndex:fila]];
    [arrayDetalle addObject:[[[contenidoWeb getComponentes]getDescripcion] objectAtIndex:fila]];
    [arrayDetalle addObject:[[[contenidoWeb getComponentes]getInicio] objectAtIndex:fila]];
    [arrayDetalle addObject:[[[contenidoWeb getComponentes]getFin] objectAtIndex:fila]];
    [arrayDetalle addObject:[[[contenidoWeb getComponentes]getLocalizacion] objectAtIndex:fila]];
}

@end
