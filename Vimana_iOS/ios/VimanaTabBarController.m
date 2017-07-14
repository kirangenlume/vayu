//
//  VimanaTabBarController.m
//  Vayuyan
//
//  Created by suryateja on 3/10/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "VimanaTabBarController.h"

@implementation VimanaTabBarController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    int divide = 5;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(self.tabBar.frame.origin.x,self.tabBar.frame.origin.y, self.view.frame.size.width/divide, 56)];
    UIImageView *border = [[UIImageView alloc]initWithFrame:CGRectMake(view.frame.origin.x + 10,view.frame.size.height-6, (self.view.frame.size.width/divide)-20, 3)];
    
    border.backgroundColor =[UIColor colorWithDisplayP3Red:32.0/255.0 green:178.0/255.0 blue:170.0/255.0 alpha:1.0];
    //border.backgroundColor =[UIColor colorWithDisplayP3Red:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1.0];

    [view addSubview:border];
    [UIView animateWithDuration:0.5 animations:^{
        [view layoutIfNeeded];
    }];
    [self.tabBar setSelectionIndicatorImage:[self ChangeViewToImage:view]];
}
-(UIImage *)ChangeViewToImage:(UIView *)viewForImage{
    
    UIGraphicsBeginImageContext(viewForImage.bounds.size);
    [viewForImage.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
