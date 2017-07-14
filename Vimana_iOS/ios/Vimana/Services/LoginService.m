//
//  LoginService.m
//  Vayuyan
//
//  Created by kirang on 4/10/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService


-(void)sendRequestForLoginService: (NSInteger)uniqueNum withPayload:(NSString *)userName {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://luk0r3ls53.execute-api.us-west-1.amazonaws.com/VimanaQA/account/%@",userName]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"login service %@ %@", response, responseObject);
            if ([self.delegate respondsToSelector:@selector(responseData:)]) {
                NSDictionary *responseDict = @{@"refID": [NSNumber numberWithInteger:uniqueNum],
                                               @"responseData": responseObject};
            
                [self.delegate performSelector:@selector(responseData:) withObject: responseDict];
            }
        }
    }];
    [dataTask resume];
}

@end
