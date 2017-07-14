//
//  AwsManager.h
//  Vayuyan
//
//  Created by Vamsi Chintalapati on 3/9/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AwsManager : NSObject

    + (id) sharedManager;

    -(void) getConnectedDevicesWithUserId:(NSString*) userId
                            onSuccess:(void (^)(NSObject*))success onError:(void (^)(NSError*))error;

@end
