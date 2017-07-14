//
//  NetworkInterfaces.h
//  Vayuyan
//
//  Created by Vamsi Chintalapati on 10/18/16.
//  Copyright © 2016 Vayuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkInterface : NSObject

    @property(nonatomic, strong) NSString *ifname;
    @property(nonatomic, strong) NSString *ipaddr;
    @property(nonatomic, strong) NSString *netmask;
    @property(nonatomic, strong) NSString *type;
    @property(nonatomic, strong) NSString *proto;

@end
