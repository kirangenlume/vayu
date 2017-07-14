//
//  AwsManager.m
//  Vayuyan
//
//  Created by Vamsi Chintalapati on 3/9/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "AwsManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "DCKeyValueObjectMapping.h"
#import "DCParserConfiguration.h"
#import "DCArrayMapping.h"
#import "AwsResponse.h"
#import "Connection.h"
#import "Constants.h"

@interface AwsManager ()

    @property (nonatomic, strong) AFHTTPRequestOperationManager *client;

@end


@implementation AwsManager

+ (id) sharedManager {
    static AwsManager *sharedMyManager = nil;
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
        self.client = [AFHTTPRequestOperationManager manager];
        self.client.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

-(void) getConnectedDevicesWithUserId:(NSString*) userId
                               onSuccess:(void (^)(NSObject*))success onError:(void (^)(NSError*))error {
    NSString *url = [[AWS_URL stringByAppendingString:@"device/"] stringByAppendingString:userId];
    [self.client GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        DCParserConfiguration *config = [DCParserConfiguration configuration];
        DCKeyValueObjectMapping *parser = [DCKeyValueObjectMapping mapperForClass:[Connection class]  andConfiguration:config];
        NSArray *devices = [parser parseArray:responseObject];
        NSLog(@"Connections: %@", devices);
        success(devices);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        NSLog(@"Error: %@", err);
        error(err);
    }];
}

@end
