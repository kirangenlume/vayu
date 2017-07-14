//
//  ProfileDetailViewController.h
//  Vayuyan
//
//  Created by suryateja on 4/5/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)dismissAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *profileName;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeToGoBack;

@property (nonatomic) NSString *profileNameData;
@end
