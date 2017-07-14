//
//  SignupViewController.h
//  Vayuyan
//
//  Created by kirang on 3/31/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftImageTextField-Swift.h"

@interface SignupViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
    @property (strong, nonatomic) IBOutlet LeftImageTextField *nameTextField;
    @property (strong, nonatomic) IBOutlet LeftImageTextField *emailTextField;
    @property (weak, nonatomic) IBOutlet LeftImageTextField *passwordTextfield;

@end
