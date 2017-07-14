//
//  GuestAlertViewController.m
//  Vayuyan
//
//  Created by suryateja on 3/24/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "GuestAlertViewController.h"
#import "DashboardViewController.h"

@interface GuestAlertViewController ()

@property (nonatomic) NSInteger pressedButton;

@end

@implementation GuestAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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

- (IBAction)dismissAction:(id)sender {

    /*[UIView animateWithDuration:0.3f animations:^{
        [self.view setBackgroundColor:[[UIColor clearColor] colorWithAlphaComponent:0.0]];
        [UIView animateWithDuration:0.4f animations:^{
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }];
        
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];*/
    UIButton *b = (UIButton *)sender;
    if([b.currentTitle  isEqual:@"Allow"]){
        _pressedButton = 1;
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"dismissRequest"
     object:nil ];
    }
    


    
    [self dismissViewControllerAnimated:YES completion:nil];

    //[self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue{
    DashboardViewController *dvc = segue.sourceViewController;
    dvc.noOfGuestRequestsTempVariable= _pressedButton;
    
}


@end
