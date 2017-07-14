//
//  CustomView.m
//  VimanaCircle
//
//  Created by kirang on 3/7/17.
//  Copyright © 2017 kirang. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (id)initWithFrame:(CGRect)frame {

    if (self) {
        self = [super initWithFrame:frame];
      /*  _firstColor=[UIColor colorWithRed:(37.0/255.0) green:(252.0/255) blue:(244.0/255.0) alpha: 1.0];
        _secondColor=[UIColor colorWithRed:(171.0/255.0) green:(250.0/255) blue:(81.0/255.0) alpha: 1.0];
        _thirdColor=[UIColor colorWithRed:(238.0/255.0) green:(32.0/255) blue:(53.0/255.0) alpha: 1.0];*/
      //  self.firstColor =[UIColor colorWithRed:(37.0/255.0) green:(252.0/255) blue:(244.0/255.0) alpha: 1.0];
        //self.secondColor = [UIColor  colorWithRed:(171.0/255.0) green:(250.0/255) blue:(81.0/255.0) alpha: 1.0];
       // self.thirdColor = [UIColor colorWithRed:(238.0/255.0) green:(32.0/255) blue:(53.0/255.0) alpha: 1.0];
        _innerCircleRadius = 40;
        _middleCircleRadius = 115;
        _outerCircleRadius = 190;
        self.backgroundColor = [UIColor clearColor];
        [self drawRect:frame];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [self addCircle:_innerCircleRadius capRadius:20 and:_firstColor];
    [self addCircle:_middleCircleRadius capRadius:20 and:_secondColor];
    [self addCircle:_outerCircleRadius capRadius:20 and:_thirdColor];

}



-(void) addCircle:(CGFloat)arcRadius capRadius:(CGFloat)capRadius and:(UIColor *)color {
    CGFloat X = CGRectGetMidX(self.bounds);
    CGFloat Y = CGRectGetMidY(self.bounds);
    
    //Bottom Oval
    UIBezierPath *pathBottom = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(X -(arcRadius/2) , Y - (arcRadius/2), arcRadius, arcRadius)];
    [self addOval:30.0 path:[pathBottom CGPath]strokeStart:0 strokeEnd:0.5 strokeColor:color fillColor:[UIColor clearColor] shadowRadius:0.75 shadowOpacity:0.5 shadowOffSet:CGSizeZero];
    
    //Middle Cap
    UIBezierPath *pathMiddle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(X -(capRadius/2) , Y - (capRadius/2), capRadius, capRadius)];
    [self addOval:0.0 path:[pathMiddle CGPath]strokeStart:0 strokeEnd:1.0 strokeColor:color fillColor:[UIColor clearColor] shadowRadius:0 shadowOpacity:0 shadowOffSet:CGSizeZero];
    
    //top Val
    UIBezierPath *pathTop = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(X -(arcRadius/2) , Y - (arcRadius/2), arcRadius, arcRadius)];
    [self addOval:30.0 path:[pathTop CGPath]strokeStart:0.5 strokeEnd:1.0 strokeColor:color fillColor:[UIColor clearColor] shadowRadius:0.75 shadowOpacity:0.5 shadowOffSet:CGSizeZero];
    
}

-(void) addOval:(CGFloat)lineWidth path:(CGPathRef)path strokeStart:(CGFloat)strokeStart strokeEnd:(CGFloat)strokeEnd strokeColor:(UIColor *)strokeColor fillColor:(UIColor*)fillColor shadowRadius:(CGFloat)shadowRadius shadowOpacity:(float)shadowOpacity shadowOffSet:(CGSize)shadowOffSet {
    
    CAShapeLayer *arc = [CAShapeLayer layer];
    arc.lineWidth = lineWidth;
    arc.path = path;
    arc.strokeStart = strokeStart;
    arc.strokeEnd = strokeEnd;
    arc.strokeColor = [strokeColor CGColor];
    arc.fillColor = fillColor.CGColor;
    arc.shadowColor = [[UIColor blackColor] CGColor];
    arc.shadowRadius = shadowRadius;
    arc.shadowOpacity = shadowOpacity;
    arc.shadowOffset = shadowOffSet;
    [self.layer addSublayer:arc];
   // [self.layer insertSublayer:arc atIndex:1];

    
}

@end
