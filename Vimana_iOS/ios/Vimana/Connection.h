//
//  Connection.h
//  Vimana
//
//  Created by Vamsi Chintalapati on 7/15/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connection : NSObject

    @property (strong, readwrite, nonatomic) NSString *name;
    @property (strong, readwrite, nonatomic) NSString *macAddress;
    @property (strong, readwrite, nonatomic) NSString *ipAddress;
    @property (strong, readwrite, nonatomic) NSString *type;
    @property (strong, readwrite, nonatomic) NSString *profileImage;
    @property (strong, readwrite, nonatomic) NSString *signal;
    @property (strong, readwrite, nonatomic) NSString *signalStrength;
    @property (strong, readwrite, nonatomic) NSString *connectionType;
    @property (strong, readwrite, nonatomic) NSString *connectionTypeDetail;
    @property (strong, readwrite, nonatomic) NSString *uploadSpeed;
    @property (strong, readwrite, nonatomic) NSString *downloadSpeed;
    @property (strong, readwrite, nonatomic) NSString *profileType;
    @property (strong, readwrite, nonatomic) NSString *activeDuration;
    @property (strong, readwrite, nonatomic) NSString *restrictions;
    @property (strong, readwrite, nonatomic) NSString *usage;
    @property (strong, readwrite, nonatomic) NSString *userId;
    @property (readwrite, nonatomic) BOOL isPriority;

-(id)initWithId:(NSString *)identifier name:(NSString*)name andImage:(NSString*)image;

@end
