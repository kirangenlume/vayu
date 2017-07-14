//
//  CreateAutomationViewController.h
//  Vayuyan
//
//  Created by kirang on 4/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftImageTextField-Swift.h"


@interface CreateAutomationViewController : UIViewController
- (IBAction)addAsceneAction:(id)sender;
@property (weak, nonatomic) IBOutlet LeftImageTextField *automationNameTextField;
@property (weak, nonatomic) IBOutlet LeftImageTextField *deviceNameTextField;
@property (weak, nonatomic) IBOutlet LeftImageTextField *triggerTextField;
@property (weak, nonatomic) IBOutlet LeftImageTextField *chooseAdeviceTextField;
@property (weak, nonatomic) IBOutlet LeftImageTextField *actionTextField;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@property (nonatomic, weak) NSString *automationName;
- (IBAction)createAction:(id)sender;
@end
