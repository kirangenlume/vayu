//
//  Alert.m
//  Accelero
//
//  Created by Vamsi Chintalapati on 4/4/16.
//  Copyright © 2016 KarVi. All rights reserved.
//

#import "Json.h"

@implementation Json

- (NSString *)description
{
    return [NSString stringWithFormat:@"userId:%@, id:%@ title:%@ and body:%@", self.userId, self.id1, self.title, self.body];
}

@end
