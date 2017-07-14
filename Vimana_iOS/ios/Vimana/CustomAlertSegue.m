//
//  CustomAlertSegue.m
//  Vayuyan
//
//  Created by suryateja on 3/24/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "CustomAlertSegue.h"

@implementation CustomAlertSegue

-(void)perform{
    UIViewController *dst = [self destinationViewController];
    UIViewController *src = [self sourceViewController];
    
    // add the view to the hierarchy and bring to front
    // <iOS8 Check
    if(src.view.frame.size.width != dst.view.frame.size.width){
        CGRect rect = dst.view.frame;
        rect.size.width = src.view.frame.size.width;
        [dst.view setFrame:rect];
    }
    [src addChildViewController:dst];
    [src.view addSubview:dst.view];
    [src.view bringSubviewToFront:dst.view];
    
    [UIView animateWithDuration:0.3f animations:^{
        [dst.view setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.3]];
    }];
}

@end
