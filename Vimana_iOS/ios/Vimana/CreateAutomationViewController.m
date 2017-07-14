//
//  CreateAutomationViewController.m
//  Vayuyan
//
//  Created by kirang on 4/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "CreateAutomationViewController.h"

@interface CreateAutomationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *IoTautomationName;
@property (weak, nonatomic) IBOutlet UILabel *automationText;

@end

@implementation CreateAutomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //AutomationName corner radius and shadow color
    _automationNameTextField .layer.masksToBounds = NO;
    _automationNameTextField .layer.shadowRadius = 3.0;
    _automationNameTextField .layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _automationNameTextField .layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _automationNameTextField .layer.shadowOpacity = 1.0;
    _automationNameTextField .layer.cornerRadius = 3.0;
    
    
    _deviceNameTextField .layer.masksToBounds = NO;
    _deviceNameTextField .layer.shadowRadius = 3.0;
    _deviceNameTextField .layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _deviceNameTextField .layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _deviceNameTextField .layer.shadowOpacity = 1.0;
    _deviceNameTextField .layer.cornerRadius = 3.0;
    
    _triggerTextField .layer.masksToBounds = NO;
    _triggerTextField .layer.shadowRadius = 3.0;
    _triggerTextField .layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _triggerTextField .layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _triggerTextField .layer.shadowOpacity = 1.0;
    _triggerTextField .layer.cornerRadius = 3.0;
    
    _chooseAdeviceTextField .layer.masksToBounds = NO;
    _chooseAdeviceTextField .layer.shadowRadius = 3.0;
    _chooseAdeviceTextField.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _chooseAdeviceTextField .layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _chooseAdeviceTextField .layer.shadowOpacity = 1.0;
    _chooseAdeviceTextField .layer.cornerRadius = 3.0;
    
    _actionTextField .layer.masksToBounds = NO;
    _actionTextField .layer.shadowRadius = 3.0;
    _actionTextField.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _actionTextField .layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _actionTextField .layer.shadowOpacity = 1.0;
    _actionTextField .layer.cornerRadius = 3.0;
    
    
    if (_automationName != nil) {
        _IoTautomationName.text = _automationName;
        [_automationNameTextField removeFromSuperview];
        [_automationText removeFromSuperview];
    }

}
- (IBAction)createAction:(id)sender {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
