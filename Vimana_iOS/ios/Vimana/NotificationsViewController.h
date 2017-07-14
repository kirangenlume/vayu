//
//  NotificationsViewController.h
//  Vayuyan
//
//  Created by suryateja on 3/24/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)onSwipe:(id)sender;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swiper;


@end
