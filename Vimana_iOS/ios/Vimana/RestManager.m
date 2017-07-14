//
//  AlertsManager.m
//  Accelero
//
//  Created by Vamsi Chintalapati on 3/30/16.
//  Copyright © 2016 KarVi. All rights reserved.
//
#import "RestManager.h"
//#import <RestKit/RestKit.h>
#import "JsonResponse.h"

@interface RestManager ()

//@property (nonatomic, strong) RKObjectManager *manager;

@end

@implementation RestManager

@synthesize delegate;


+ (id)sharedManager {
    static RestManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/"];
        
//        RKObjectMapping *jsonMapping = [RKObjectMapping mappingForClass:[JsonResponse class]];
//        [jsonMapping addAttributeMappingsFromDictionary:@{
//                                                           @"userId":  @"userId",
//                                                           @"id": @"id1",
//                                                           @"title":  @"title",
//                                                           @"body":  @"body"
//                                                           }];
//        RKResponseDescriptor *jsonResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:jsonMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:nil];
//        
//        [self setManager:[RKObjectManager managerWithBaseURL:url]];
//        [self.manager addResponseDescriptor:jsonResponseDescriptor];    
    }
    return self;
}

-(void) getJson {
    
//    [self.manager getObject:nil path:@"posts" parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
//        NSLog(@"Response: %@", result);
//        NSLog(@"[Response firstObject]: %@", [result firstObject]);
//        if (delegate != NULL) {
//            [delegate restManager:self didRespondWithList:[result array]];
//        }
//    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//        NSLog(@"Error occured: %@", error);
//        [delegate restManager:self didFailWithError:error];
//    }];
}

@end