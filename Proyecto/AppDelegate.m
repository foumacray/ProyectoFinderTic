//
//  AppDelegate.m
//  Proyecto
//
//  Created by Alumno 6 on 08/02/13.
//  Copyright (c) 2013 Alumno 2. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self identificarDispositivo];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)identificarDispositivo{ // elegir que storyboard queremos usar
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) { // diferencia entre iphone o ipad
        CGSize iosDeviceScreenSize = [[UIScreen mainScreen]bounds].size;
        if (iosDeviceScreenSize.height == 960/2) {
            UIStoryboard *dispositivo4=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil]; //1º enlazar el storyboard
            UIViewController *controlador4 = [dispositivo4 instantiateInitialViewController];           //2º  crear un controlador
            self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];                //3º  definir la ventana
            self.window.rootViewController = controlador4;                                              //4º asignar el controlador de la ventana
            [self.window makeKeyAndVisible];                                                            //5º arrancarla
        }
        else if(iosDeviceScreenSize.height == 568) {
            UIStoryboard *dispositivo4=[UIStoryboard storyboardWithName:@"MainStoryBoard2" bundle:nil]; //1º enlazar el storyboard
            UIViewController *controlador4 = [dispositivo4 instantiateInitialViewController];           //2º  crear un controlador
            self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];                //3º  definir la ventana
            self.window.rootViewController = controlador4;                                              //4º asignar el controlador de la ventana
            [self.window makeKeyAndVisible];                                                            //5º arrancarla
        }
    }
}
@end
