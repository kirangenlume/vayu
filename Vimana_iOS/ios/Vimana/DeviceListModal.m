//
//  DeviceListModal.m
//  Vimana_DevicesScreenR&D
//
//  Created by suryateja on 3/8/17.
//  Copyright © 2017 ENLUME. All rights reserved.
//

#import "DeviceListModal.h"

@implementation DeviceListModal

- (instancetype)init{
    _signal=@"Good";
    _deviceName = @"Sample Device";
    _connectionType=@"Ethernet";
    _profileImage=[UIImage imageNamed:@"images1.jpeg"];
    
    
    _weakSignalStrengthDeviceIndices = [[NSMutableArray alloc] init];
    _goodSignalStrengthDeviceIndices = [[NSMutableArray alloc] init];
    _verygoodSignalStrengthDeviceIndices = [[NSMutableArray alloc] init];
    _excellentSignalStrengthDeviceIndices = [[NSMutableArray alloc] init];
    
    return  self;
}

-(void) segregateDevices{
    
    for (int deviceIndex=0; deviceIndex<_connectedDevicesList.count; deviceIndex++) {
        NSLog(@"%@",[[_connectedDevicesList objectAtIndex:deviceIndex] objectForKey:@"signal"]);
        if ([[[_connectedDevicesList objectAtIndex:deviceIndex] objectForKey:@"signal"] isEqualToString:@"Weak"]) {
            [_weakSignalStrengthDeviceIndices addObject:[NSNumber numberWithInt:deviceIndex]];
            
        }
        if ([[[_connectedDevicesList objectAtIndex:deviceIndex] objectForKey:@"signal"] isEqualToString:@"Wired"]) {
            [_verygoodSignalStrengthDeviceIndices addObject:[NSNumber numberWithInt:deviceIndex]];
        }
        
        if ([[[_connectedDevicesList objectAtIndex:deviceIndex] objectForKey:@"signal"] isEqualToString:@"Good"]) {
            [_goodSignalStrengthDeviceIndices addObject:[NSNumber numberWithInt:deviceIndex]];
        }
        
        if ([[[_connectedDevicesList objectAtIndex:deviceIndex] objectForKey:@"signal"] isEqualToString:@"Excellent"]) {
            [_excellentSignalStrengthDeviceIndices addObject:[NSNumber numberWithInt:deviceIndex]];
        }
    }
    
    NSLog(@"%@ %@ %@ %@",_excellentSignalStrengthDeviceIndices,_goodSignalStrengthDeviceIndices,_verygoodSignalStrengthDeviceIndices,_weakSignalStrengthDeviceIndices);
}



@end
