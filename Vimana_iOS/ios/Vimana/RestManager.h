//
//  AlertsManager.h
//  Accelero
//
//  Created by Vamsi Chintalapati on 3/30/16.
//  Copyright © 2016 KarVi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonResponse.h"

@protocol JsonProtocol;

@interface RestManager : NSObject

@property(nonatomic, weak) id<JsonProtocol> delegate;

+ (id)sharedManager;

-(void) getJson;

@end

@protocol JsonProtocol

-(void) restManager:(RestManager*)manager didRespondWithList:(NSArray*) jsonResponse;
-(void) restManager:(RestManager*)manager didFailWithError:(NSError*) error;

@end
