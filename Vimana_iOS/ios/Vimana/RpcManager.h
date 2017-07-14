//
//  RpcManager.h
//  Vayuyan
//
//  Created by Vamsi Chintalapati on 10/17/16.
//  Copyright © 2016 Vayuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RpcManager;


@interface RpcManager : NSObject

+ (id) sharedManager;

- (void) doLoginWithUsername:(NSString*) username andPassword:(NSString*)password
                onSuccess:(void (^)(NSString*))success onError:(void (^)(NSError*))error;

-(void) getNetworkInterfacesWithSessionId:(NSString*) sessionId
                onSuccess:(void (^)(NSObject*))success onError:(void (^)(NSError*))error;

-(void) getConnectedDevicesWithSessionId:(NSString*) sessionId
                onSuccess:(void (^)(NSObject*))success onError:(void (^)(NSError*))error;

@end
