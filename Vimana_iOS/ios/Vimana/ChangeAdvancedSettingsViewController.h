//
//  ChangeAdvancedSettingsViewController.h
//  Vayuyan
//
//  Created by suryateja on 4/4/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeAdvancedSettingsViewController : UIViewController

@property (nonatomic) NSInteger selectedIndex;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)dismissAction:(id)sender;
//- (IBAction)onClickAddButton:(id)sender;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeToGoBack;

@end
