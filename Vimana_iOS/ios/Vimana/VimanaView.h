//
//  VimanaView.h
//  VimanaCircle4
//
//  Created by kirang on 3/14/17.
//  Copyright © 2017 kirang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VimanaView : UIView
@property (nonatomic) UIColor *bgColor;
@property (nonatomic) UIColor *deviceColor;
    
-(void)drawDeviceWithSignalStrength:(NSUInteger)signalStrength andCoOrdinates:(CGPoint)coordinates;
@end
