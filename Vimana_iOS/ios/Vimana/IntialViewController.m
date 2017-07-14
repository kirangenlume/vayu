//
//  IntialViewController.m
//  Vayuyan
//
//  Created by kirang on 3/24/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "IntialViewController.h"
#import "LoginViewController.h"

@interface IntialViewController ()

@end

@implementation IntialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _animatedImageView.animationImages = [NSArray arrayWithObjects:
                                         [UIImage imageNamed:@"VimanaSlow0.png"],
                                         [UIImage imageNamed:@"VimanaSlow1.png"],
                                         [UIImage imageNamed:@"VimanaSlow2.png"],
                                         [UIImage imageNamed:@"VimanaSlow3.png"], nil];
    _animatedImageView.animationDuration = 1.0f;
    _animatedImageView.animationRepeatCount = 0;
    [_animatedImageView startAnimating];
    [self performSelector:@selector(loadingNextView)
               withObject:nil afterDelay:4.0f];
}
- (void)loadingNextView{
    
    LoginViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginScreen"];
    [self.navigationController pushViewController:loginViewController animated:YES];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
