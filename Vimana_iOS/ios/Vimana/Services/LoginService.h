//
//  LoginService.h
//  Vayuyan
//
//  Created by kirang on 4/10/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Constants.h"
#import "ResponseProtocol.h"

@interface LoginService : NSObject

-(void)sendRequestForLoginService: (int)uniqueNum withPayload:(NSString *)userName;
@property (weak) id <ResponseSProtocol> delegate;

@end
