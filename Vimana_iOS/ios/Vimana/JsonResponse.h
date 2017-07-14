//
//  AlertsResponse.h
//  Accelero
//
//  Created by Vamsi Chintalapati on 4/2/16.
//  Copyright © 2016 KarVi. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface JsonResponse : NSObject

@property (nonatomic, copy) NSNumber *userId;
@property (nonatomic, copy) NSNumber *id1;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *body;

@end

