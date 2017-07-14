//
//  NotificaionServices.m
//  Vayuyan
//
//  Created by kirang on 4/10/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "NotificaionServices.h"
#import "AFNetworking.h"

@implementation NotificaionServices

-(void)getNotifationswithPayload:(NSString *)routerName {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://luk0r3ls53.execute-api.us-west-1.amazonaws.com/VimanaQA/notification/%@",routerName]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"login service %@ %@", response, responseObject);
            if ([self.delegate respondsToSelector:@selector(responseData:)]) {
                
                [self.delegate performSelector:@selector(responseData:) withObject:responseObject];
            }
        }
    }];
    [dataTask resume];
}

@end
