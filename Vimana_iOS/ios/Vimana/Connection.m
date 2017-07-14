//
//  Connection.m
//  Vimana
//
//  Created by Vamsi Chintalapati on 7/15/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import "Connection.h"

@implementation Connection

- (instancetype)initWithId:(NSString *)identifier name:(NSString*)name andImage:(NSString*)image
{
    self = [super init];
    if (self) {
        self.userId = identifier;
        self.name = name;
        self.profileImage = image;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Connection [ userId: %@, name:%@ and profileImage:%@ isPriority:%d]",
            self.userId, self.name, self.profileImage, self.isPriority];
}

@end
