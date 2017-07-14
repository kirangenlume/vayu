//
//  VimanaView.m
//  VimanaCircle4
//
//  Created by kirang on 3/14/17.
//  Copyright © 2017 kirang. All rights reserved.
//

#import "VimanaView.h"
typedef enum SignalStrength{
    excellent,
    good,
    fair,
    poor
}SignalStrength;
@implementation VimanaView
 /*   -65 or more: excellent
    -66 to -73 : good
    -74 to -80 : fair
    -81 to -94 : poor
    */
    
@synthesize bgColor;
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    float xPosition = self.bounds.size.width/2;
    float yPosition = self.bounds.size.height/2;
    //innercircle
    //[self drawElipsewithOrigin:xPosition - 5  andY:yPosition - 5 width:10.0 height:10.0 withLayerindexPath:1];
        UIImageView *logoCentre = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition - 12, yPosition - 12, 25, 25)];
     logoCentre.image = [UIImage imageNamed:@"Home_on"];
    [self addSubview:logoCentre];
    
    //excellent circle
    [self drawElipsewithOrigin:xPosition - 25 andY:yPosition - 25 width:50 height:50 withLayerindexPath:0];

    //good Circle
    [self drawElipsewithOrigin:xPosition - 75 andY:yPosition - 62 width:150 height:125 withLayerindexPath:0];
    //fair circle
    [self drawElipsewithOrigin:xPosition - 112 andY:yPosition - 90 width:225 height:180 withLayerindexPath:0];
    //poor circle
    [self drawElipsewithOrigin:xPosition - 150 andY:yPosition - 125 width:300 height:250 withLayerindexPath:0];


}
-(void)drawElipsewithOrigin:(float)x andY:(float)y width:(float)width height:(float)height withLayerindexPath:(int)layerIndex{
    
    CGPoint ellipseOrigin = CGPointMake(x,y);
    CGSize ellipseSize = CGSizeMake(width, height);
    CGRect rect = (CGRect){CGPointZero, ellipseSize};
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, rect);
    
    CAShapeLayer *ellipseLayer = [CAShapeLayer layer];
    ellipseLayer.frame = (CGRect){ellipseOrigin, ellipseSize};
    ellipseLayer.path = path;
    ellipseLayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
    ellipseLayer.lineWidth = 2.0;
    ellipseLayer.fillColor =  [UIColor whiteColor].CGColor;
    ellipseLayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
    ellipseLayer.shadowOffset = CGSizeMake(1, 1);
    ellipseLayer.shadowOpacity = 1.0;
    
    
    CFRelease(path);
    
    // I tested it in the viewDidLoad method of a view controller
    ///   [_deviceMapView.layer insertSublayer:ellipseLayer atIndex:layerIndex];
    //[self.layer addSublayer:ellipseLayer];
    [self.layer insertSublayer:ellipseLayer atIndex:layerIndex];
    CABasicAnimation *drawAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnim.duration = 5.0;
    drawAnim.fromValue = [NSNumber numberWithFloat:0.0f];
    drawAnim.toValue = [NSNumber numberWithFloat:1.0f];
  //  [ellipseLayer addAnimation:drawAnim forKey:@"strokeEnd"];
}


-(void)drawDeviceWithSignalStrength:(NSUInteger)signalStrength andCoOrdinates:(CGPoint)coordinates {
    float xPosition = self.bounds.size.width/2;
    float yPosition = self.bounds.size.height/2;
    
    if (coordinates.x >= 0 && coordinates.y >= 0) {
        
        if (signalStrength >= -66 || signalStrength >= -73) { //    -66 to -73 : good
            
            float xPointValue = 75.00/100.00;
            float yPointValue = 62.00/100.00;
            
            float excellentXposition = xPosition + 25.0;
            float excellentYposition = yPosition - 25.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            float finalXposition = excellentXposition + ((coordinateXvalue * 50)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 40)/100);
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor greenColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
        } else if (signalStrength >= -74 || signalStrength >= -80) {   //     -74 to -80 : fair
            
            float xPointValue = 112.0/100.0;
            float yPointValue = 90.0/100.0;
            
            float excellentXposition = xPosition + 75.0;
            float excellentYposition = yPosition - 62.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            
            float finalXposition = excellentXposition + ((coordinateXvalue * 37)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 28)/100);
            NSLog(@"original position is %f and % f \n coordinate x%f y%f",finalXposition,finalYposition,coordinates.x,coordinates.y);
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor orangeColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
            
        } else if (signalStrength >= -81 || signalStrength >= -94) {   //  -81 to -94 : poor
            
            float xPointValue = 150.00/100.00;
            float yPointValue = 125.00/100.00;
            
            float excellentXposition = xPosition + 150.0;
            float excellentYposition = yPosition - 175.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            float finalXposition = excellentXposition + ((coordinateXvalue * 43)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 25)/100);
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor redColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
        }
        
        
    } else if (coordinates.x >= 0 && coordinates.y < 0) {
        
        if (signalStrength >= -66 || signalStrength >= -73) { //    -66 to -73 : good
            
            
            float xPointValue = 75.00/100.00;
            float yPointValue = 62.00/100.00;
            
            float excellentXposition = xPosition + 25.0;
            float excellentYposition = yPosition + 25.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            //  float finalXposition = excellentXposition + coordinateXvalue;
            // float finalYposition = excellentYposition - coordinateYvalue;
            
            float finalXposition = excellentXposition + ((coordinateXvalue * 50)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 40)/100);
            // NSLog(@"original position is %f and % f \n coordinate x%f y%f",finalXposition,finalYposition,coordinates.x,coordinates.y);
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor greenColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
        } else if (signalStrength >=-74 || signalStrength >= -80) {   //     -74 to -80 : fair
            
            float xPointValue = 112.0/100.0;
            float yPointValue = 90.0/100.0;
            
            float excellentXposition = xPosition + 75.0;
            float excellentYposition = yPosition + 62.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            
            float finalXposition = excellentXposition + ((coordinateXvalue * 37)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 28)/100);
            NSLog(@"original position is %f and % f \n coordinate x%f y%f",finalXposition,finalYposition,coordinates.x,coordinates.y);
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor orangeColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
            
        } else if (signalStrength >=81 || signalStrength >= -94) {   //  -81 to -94 : poor
            
            
            float xPointValue = 150.00/100.00;
            float yPointValue = 125.00/100.00;
            
            float excellentXposition = xPosition + 150.0;
            float excellentYposition = yPosition + 175.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            float finalXposition = excellentXposition + ((coordinateXvalue * 43)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 25)/100);
            
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor redColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
        }
        
        
    }else if (coordinates.x < 0 && coordinates.y < 0) {
        
        if (signalStrength >= -66 || signalStrength >= -73) { //    -66 to -73 : good
            
            
            float xPointValue = 75.00/100.00;
            float yPointValue = 62.00/100.00;
            
            float excellentXposition = xPosition - 25.0;
            float excellentYposition = yPosition + 25.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            //  float finalXposition = excellentXposition + coordinateXvalue;
            // float finalYposition = excellentYposition - coordinateYvalue;
            
            float finalXposition = excellentXposition + ((coordinateXvalue * 50)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 40)/100);
            // NSLog(@"original position is %f and % f \n coordinate x%f y%f",finalXposition,finalYposition,coordinates.x,coordinates.y);
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor greenColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
        } else if (signalStrength >=-74 || signalStrength >= -80) {   //     -74 to -80 : fair
            
            float xPointValue = 112.0/100.0;
            float yPointValue = 90.0/100.0;
            
            float excellentXposition = xPosition - 75.0;
            float excellentYposition = yPosition + 62.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            
            float finalXposition = excellentXposition + ((coordinateXvalue * 37)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 28)/100);
            NSLog(@"original position is %f and % f \n coordinate x%f y%f",finalXposition,finalYposition,coordinates.x,coordinates.y);
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor orangeColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
            
        } else if (signalStrength >=81 || signalStrength >= -94) {   //  -81 to -94 : poor
            
            
            float xPointValue = 150.00/100.00;
            float yPointValue = 125.00/100.00;
            
            float excellentXposition = xPosition - 150.0;
            float excellentYposition = yPosition + 175.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            float finalXposition = excellentXposition + ((coordinateXvalue * 43)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 25)/100);
            
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor redColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
        }
        
    }else if (coordinates.x < 0 && coordinates.y >= 0) {
        if (signalStrength >= -66 || signalStrength >= -73) { //    -66 to -73 : good
            
            
            float xPointValue = 75.00/100.00;
            float yPointValue = 62.00/100.00;
            
            float excellentXposition = xPosition - 25.0;
            float excellentYposition = yPosition - 25.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            //  float finalXposition = excellentXposition + coordinateXvalue;
            // float finalYposition = excellentYposition - coordinateYvalue;
            
            float finalXposition = excellentXposition + ((coordinateXvalue * 50)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 40)/100);
            // NSLog(@"original position is %f and % f \n coordinate x%f y%f",finalXposition,finalYposition,coordinates.x,coordinates.y);
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor greenColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
        } else if (signalStrength >=-74 || signalStrength >= -80) {   //     -74 to -80 : fair
            
            float xPointValue = 112.0/100.0;
            float yPointValue = 90.0/100.0;
            
            float excellentXposition = xPosition - 75.0;
            float excellentYposition = yPosition - 62.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            
            float finalXposition = excellentXposition + ((coordinateXvalue * 37)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 28)/100);
            NSLog(@"original position is %f and % f \n coordinate x%f y%f",finalXposition,finalYposition,coordinates.x,coordinates.y);
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor orangeColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
            
        } else if (signalStrength >=81 || signalStrength >= -94) {   //  -81 to -94 : poor
            
            
            float xPointValue = 150.00/100.00;
            float yPointValue = 125.00/100.00;
            
            float excellentXposition = xPosition - 150.0;
            float excellentYposition = yPosition - 175.0;
            float coordinateXvalue = xPointValue * coordinates.x;
            float coordinateYvalue = yPointValue * coordinates.y;
            float finalXposition = excellentXposition + ((coordinateXvalue * 43)/100);
            float finalYposition = excellentYposition + ((coordinateYvalue * 25)/100);
            
            
            
            CGPoint ellipseOrigin = CGPointMake(finalXposition,finalYposition);
            CGSize ellipseSize = CGSizeMake(6, 6);
            CGRect rect = (CGRect){CGPointZero, ellipseSize};
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddEllipseInRect(path, NULL, rect);
            
            CAShapeLayer *ellipselayer = [CAShapeLayer layer];
            ellipselayer.frame = (CGRect){ellipseOrigin, ellipseSize};
            ellipselayer.path = path;
            ellipselayer.strokeColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.lineWidth = 2.0;
            ellipselayer.fillColor =  [UIColor redColor].CGColor;
            ellipselayer.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4].CGColor;
            ellipselayer.shadowOffset = CGSizeMake(1, 1);
            ellipselayer.shadowOpacity = 1.0;
            
            [self.layer insertSublayer:ellipselayer atIndex:1];
            
        }
    }
}




@end
