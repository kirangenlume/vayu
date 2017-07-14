//
//  NewDHCPReservationViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/5/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "NewDHCPReservationViewController.h"

@interface NewDHCPReservationViewController ()

@property (nonatomic,weak) IBOutlet LeftImageTextField *addDHCPReservationName;
@property (nonatomic, weak) IBOutlet LeftImageTextField *addDHCPReservationIP;
@property (weak, nonatomic) IBOutlet UIButton *createUserButton;

@end

@implementation NewDHCPReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _addDHCPReservationName.layer.masksToBounds = NO;
    _addDHCPReservationName.layer.shadowRadius = 3.0;
    _addDHCPReservationName.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _addDHCPReservationName.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _addDHCPReservationName.layer.shadowOpacity = 1.0;
    _addDHCPReservationName.layer.cornerRadius = 3.0;
    
    _addDHCPReservationIP.layer.masksToBounds = NO;
    _addDHCPReservationIP.layer.shadowRadius = 3.0;
    _addDHCPReservationIP.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _addDHCPReservationIP.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _addDHCPReservationIP.layer.shadowOpacity = 1.0;
    _addDHCPReservationIP.layer.cornerRadius = 3.0;
    
    _createUserButton.layer.shadowRadius = 3.0;
    _createUserButton.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _createUserButton.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
    _createUserButton.layer.shadowOpacity = 1.0;
    _createUserButton.layer.cornerRadius = 3.0;
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
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
