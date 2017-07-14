//
//  RouterInfo.h
//  Vayuyan
//
//  Created by kirang on 4/13/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Constants.h"
#import "ResponseProtocol.h"

@interface RouterInfo : NSObject
-(void)getRouterInfo:(int)uniqueNum withPayload:(NSString *)emialTextField;
@property (weak) id <ResponseSProtocol> delegate;
@end
