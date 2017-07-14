//
//  NotificaionServices.h
//  Vayuyan
//
//  Created by kirang on 4/10/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseProtocol.h"




@interface NotificaionServices : NSObject
-(void)getNotifationswithPayload:(NSString *)userName;
@property (weak) id <ResponseSProtocol> delegate;
@end
