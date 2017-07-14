//
//  AdvancedSettingsViewController.h
//  Vayuyan
//
//  Created by suryateja on 4/4/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvancedSettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *addProfileButton;
- (IBAction)dismissAction:(id)sender;
-(IBAction)addNewProfile:(id)sender;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeToGoBack;
@property(nonatomic) NSInteger selectedIndex;
@end
