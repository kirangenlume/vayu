//
//  AwsResponse.h
//  Vayuyan
//
//  Created by Vamsi Chintalapati on 3/10/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AwsResponse : NSObject

    @property (readwrite, nonatomic) NSInteger Count;
    @property (strong, readwrite, nonatomic) NSArray *Items;

@end
