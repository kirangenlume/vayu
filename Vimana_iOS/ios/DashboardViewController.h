//
//  DashboardViewController.h
//  Vayuyan
//
//  Created by suryateja on 3/11/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
@interface DashboardViewController : UIViewController

@property (nonatomic)   int segmentValue;


@property (weak, nonatomic) IBOutlet UILabel *internetStatus;
@property (weak, nonatomic) IBOutlet UILabel *downloadSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *uploadSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *availabilityLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *internetConnectionStatusImage;
@property (weak, nonatomic) IBOutlet UIImageView *internetConnectionStatusExclamation;

@property (weak, nonatomic) IBOutlet UILabel *speedTestTimeInfo;


@property (weak, nonatomic) IBOutlet UILabel *wiFiDevicesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *wiredDevicesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *connectedHomeDevicesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *guestsDevicesCountLabel;

@property (weak, nonatomic) IBOutlet UIView *view4;
@property (weak, nonatomic) IBOutlet UIView *usersView;

//@property (weak, nonatomic) IBOutlet UIButton *addFavouritesButton;
@property (weak, nonatomic) IBOutlet UIButton *guestRequestButton;
@property (weak, nonatomic) IBOutlet UIButton *permissionRequestButton;

@property (nonatomic) NSInteger noOfGuestRequestsTempVariable;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapToAnalyticsScreenGesture;
- (IBAction)handleTapToAnalyticsScreenGesture:(id)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapToDevicesListScreenGesture;
- (IBAction)handleTapToDevicesListScreenGesture:(id)sender;

@end
