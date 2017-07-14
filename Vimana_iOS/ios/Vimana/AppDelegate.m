//
//  AppDelegate.m
//  Vimana
//
//  Created by Vamsi Chintalapati on 6/29/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import "AppDelegate.h"
#import "RpcManager.h"
#import "AwsManager.h"

@interface AppDelegate ()

@property(nonatomic) RestManager *restManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    
    pageControl.backgroundColor = [UIColor whiteColor];
    self.restManager = [RestManager sharedManager];
    [self.restManager setDelegate:self];
    [self.restManager getJson];
    
    [[RpcManager sharedManager] doLoginWithUsername:@"root" andPassword:@"password" onSuccess:^(NSString * sessionId) {
        NSLog(@"AppDelegate SessionId %@", sessionId);
        [[RpcManager sharedManager] getNetworkInterfacesWithSessionId:sessionId onSuccess:^(NSObject *response) {
            NSLog(@"AppDelegate Response Object %@", response);
        } onError:^(NSError *err) {
            NSLog(@"AppDelegate errot %@", err);
        }];
    } onError:^(NSError *error) {
        NSLog(@"AppDelegate errot %@", error);
    }];
    
   /* [[AwsManager sharedManager] getConnectedDevicesWithUserId:@"" onSuccess:^(NSObject *response) {
        NSLog(@"AppDelegate Response Object %@", response);
    } onError:^(NSError *err) {
        NSLog(@"AppDelegate errot %@", err);
    }];*/

    
//    [client invokeMethod:@"add"
//              parameters:@[@(10), @(12)]
//                 success:^(AFHTTPRequestOperation *operation, id responseObject)
//    {
//        NSLog(@"%@", responseObject);
//        // ...
//    }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        // ...
//        NSLog(@"%@", error);
//    }];

    return YES;
}

-(void) restManager:(RestManager*)manager didRespondWithList:(NSArray*) jsonResponse {
    NSLog(@"Success! %@", jsonResponse);
}

-(void) restManager:(RestManager*)manager didFailWithError:(NSError*) error {
    NSLog(@"Error! %@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
