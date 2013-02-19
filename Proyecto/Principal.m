//
//  PrincipalViewController.m
//  Proyecto
//
//  Created by Alumno 6 on 08/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "Principal.h"
#import "Celda.h"
#import "Detalle.h"

@interface Principal ()

@end

@implementation Principal

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
         
    }
    return self;
}
- (BOOL) cargarDatos{
    contenidoWeb =[Parser new];
    [contenidoWeb entradas:@"http://www.zaragoza.es/georss/feed?id=3"];
    return true;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor= [UIColor blackColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    BOOL logica = [self cargarDatos];
      
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[contenidoWeb getComponentes] getTitulo] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Celda *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell ==nil){
        cell = [[Celda alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
     
    cell.labelTitulo.text = [[[contenidoWeb getComponentes] getTitulo]objectAtIndex:indexPath.row];
    cell.labelFechaBoton.text = [[[contenidoWeb getComponentes] getFechaPublicacion]objectAtIndex:indexPath.row];
    cell.labelFecha.text = [[[contenidoWeb getComponentes] getInicio]objectAtIndex:indexPath.row];
    cell.labelfinfecha.text = [[[contenidoWeb getComponentes] getFin]objectAtIndex:indexPath.row];
    cell.labelobservaciones.text = [[[contenidoWeb getComponentes] getDescripcion]objectAtIndex:indexPath.row];
   
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     Detalle *detailViewController = [self.storyboard ];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];*/
     
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{   //Manda a la otra vista
    if ([[segue identifier] isEqualToString:@"aDetalle"]) {
       
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Detalle *detalle = [segue destinationViewController];
        [detalle.arrayDetalle addObject:[[[contenidoWeb getComponentes]getTitulo] objectAtIndex:indexPath.row]];
         NSLog(@"aki");
        
    }
}
@end
