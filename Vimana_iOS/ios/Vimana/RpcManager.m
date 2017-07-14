//
//  RpcManager.m
//  Vayuyan
//
//  Created by Vamsi Chintalapati on 10/17/16.
//  Copyright © 2016 Vayuyan. All rights reserved.
//

#import "RpcManager.h"
#import "AFJSONRPCClient.h"
#import "KeyValueObjectMapping/DCKeyValueObjectMapping.h"
#import "NetworkInterface.h"
#import "Constants.h"

@interface RpcManager ()

@property (nonatomic, strong) AFJSONRPCClient *client;

@end

@implementation RpcManager

+ (id) sharedManager {
    static RpcManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype) init
{
    self = [super init];
    if (self) {
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [securityPolicy setValidatesDomainName:NO];
        [securityPolicy setAllowInvalidCertificates:YES];
        self.client = [AFJSONRPCClient clientWithEndpointURL:[NSURL URLWithString:ROUTER_URL]];
        self.client.securityPolicy = securityPolicy;
    }
    return self;
}

-(void) doLoginWithUsername:(NSString*) username andPassword:(NSString*)password
            onSuccess:(void (^)(NSString*))success onError:(void (^)(NSError*))error {
    
    [self.client invokeMethod:@"call" withParameters:@[@"00000000000000000000000000000000", @"session", @"login",  @{@"username":username, @"password":password}] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        NSArray *array = (NSArray*)responseObject;
        NSDictionary *dict = (NSDictionary *)[array objectAtIndex:1];
        NSLog(@"%@", [dict objectForKey:@"ubus_rpc_session"]);
        NSString *authToken = (NSString*)[dict objectForKey:@"ubus_rpc_session"];
        NSLog(@"AuthToken: %@", authToken);
        success(authToken);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        NSLog(@"%@", err);
        error(err);
    }];
    
}

-(void) getNetworkInterfacesWithSessionId:(NSString*) sessionId
                onSuccess:(void (^)(NSObject*))success onError:(void (^)(NSError*))error {
    [self.client invokeMethod:@"call" withParameters:@[sessionId, @"uci", @"get",  @{@"config":@"network"}]
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                          NSLog(@"%@", responseObject);
                          NSArray *array = (NSArray*)responseObject;
                          NSDictionary *dict = (NSDictionary *)[array objectAtIndex:1];
                          NSLog(@"dict: %@", dict);
                          DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass: [NetworkInterface class]];
                          NSDictionary *interfaces = [parser parseDictionary:[dict objectForKey:@"values"]];
                          NSLog(@"%@", interfaces);
                          success(interfaces);
                      } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
                          NSLog(@"%@", err);
                          error(err);
                      }];
}


-(void) getConnectedDevicesWithSessionId:(NSString*) sessionId
                onSuccess:(void (^)(NSObject*))success onError:(void (^)(NSError*))error {
    [self.client invokeMethod:@"call" withParameters:@[sessionId, @"iwinfo", @"assoclist",  @{@"device":@"ath1"}]
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                          NSLog(@"%@", responseObject);
                          success(responseObject);
                      } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
                          NSLog(@"%@", err);
                          error(err);
                      }];
}


@end