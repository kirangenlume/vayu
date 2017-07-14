//
//  SignupViewController.m
//  Vayuyan
//
//  Created by kirang on 3/31/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //nameTextfield
    _nameTextField.layer.masksToBounds = NO;
    _nameTextField.layer.shadowRadius = 3.0;
    _nameTextField.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _nameTextField.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _nameTextField.layer.shadowOpacity = 1.0;
    _nameTextField.layer.cornerRadius = 3.0;
    
    //emailTextfield
    _emailTextField.layer.masksToBounds = NO;
    _emailTextField.layer.shadowRadius = 3.0;
    _emailTextField.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _emailTextField.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _emailTextField.layer.shadowOpacity = 1.0;
    _emailTextField.layer.cornerRadius = 3.0;
    
    //passwordTextfield
    _passwordTextfield.layer.masksToBounds = NO;
    _passwordTextfield.layer.shadowRadius = 3.0;
    _passwordTextfield.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _passwordTextfield.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _passwordTextfield.layer.shadowOpacity = 1.0;
    _passwordTextfield.layer.cornerRadius = 3.0;
    
    _signUpBtn.layer.masksToBounds = NO;
    _signUpBtn.layer.shadowRadius = 3.0;
    _signUpBtn.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _signUpBtn.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _signUpBtn.layer.shadowOpacity = 1.0;
    _signUpBtn.layer.cornerRadius = 3.0;
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

@end
