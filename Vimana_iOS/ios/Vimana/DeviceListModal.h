//
//  DeviceListModal.h
//  Vimana_DevicesScreenR&D
//
//  Created by suryateja on 3/8/17.
//  Copyright © 2017 ENLUME. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface DeviceListModal : NSObject

@property NSString *signal;
@property NSString *macAddress;
@property NSString *ipAddress;
@property NSString *deviceName;
@property NSString *deviceType;
@property NSString *connectionType;
@property NSString *connectionTypeDetail;
@property (nonatomic ,strong) UIImage *profileImage;
@property NSString *signalStrength;
@property NSString *downloadSpeed;
@property NSString *uploadSpeed;
@property NSString *usage;
@property NSString *activeDuration;
@property NSString *profileType;
@property NSString *isPriority;


@property (nonatomic) NSArray *connectedDevicesList;
@property (nonatomic) NSMutableArray *excellentSignalStrengthDeviceIndices;
@property (nonatomic) NSMutableArray *goodSignalStrengthDeviceIndices;
@property (nonatomic) NSMutableArray *verygoodSignalStrengthDeviceIndices;
@property (nonatomic) NSMutableArray *weakSignalStrengthDeviceIndices;


-(void) segregateDevices;

@end
