//
//  CustomView.h
//  VimanaCircle
//
//  Created by kirang on 3/7/17.
//  Copyright © 2017 kirang. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CustomView : UIView


@property (nonatomic) IBInspectable UIColor *startColor;
@property (nonatomic) IBInspectable UIColor *midColor;
@property (nonatomic) IBInspectable UIColor *endColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadious;
@property (nonatomic) IBInspectable BOOL isHorizontal;


@property (nonatomic) IBInspectable UIColor * firstColor;
@property (nonatomic) IBInspectable UIColor * secondColor;
@property (nonatomic) IBInspectable UIColor * thirdColor;
@property (nonatomic) IBInspectable CGFloat coreCircleRadius;
@property (nonatomic) IBInspectable CGFloat innerCircleRadius;
@property (nonatomic) IBInspectable CGFloat middleCircleRadius;
@property (nonatomic) IBInspectable CGFloat outerCircleRadius;

@end
