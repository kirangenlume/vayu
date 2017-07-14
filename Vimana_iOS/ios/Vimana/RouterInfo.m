//
//  RouterInfo.m
//  Vayuyan
//
//  Created by kirang on 4/13/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "RouterInfo.h"

@implementation RouterInfo
-(void)getRouterInfo:(int)uniqueNum withPayload:(NSString *)emialTextField {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://luk0r3ls53.execute-api.us-west-1.amazonaws.com/VimanaQA/router/%@",emialTextField]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"router info service %@ %@", response, responseObject);
            if ([self.delegate respondsToSelector:@selector(responseData:)]) {
                NSDictionary *responseDict = @{@"refID": [NSNumber numberWithInteger:uniqueNum],
                                               @"responseData": responseObject};
                
                [self.delegate performSelector:@selector(responseData:) withObject:responseDict];
            }
        }
    }];
    [dataTask resume];
}

@end
