//
//  CargandoApp.m
//  Proyecto
//
//  Created by Alumno 6 on 04/03/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "CargandoApp.h"
#import "Principal.h"
@interface CargandoApp ()

@end

@implementation CargandoApp

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
      
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidLoad];
    UIStoryboard *story =[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    Principal *principal=[story instantiateViewControllerWithIdentifier:@"principal"];
    [self.navigationController pushViewController:principal animated:TRUE];
    

}
@end
