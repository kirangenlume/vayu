//
//  DevicesScreenTableViewCell.h
//  Vimana_DevicesScreenR&D
//
//  Created by suryateja on 3/6/17.
//  Copyright © 2017 ENLUME. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DevicesScreenTableViewCell : UITableViewCell

@property(nonatomic , weak) IBOutlet UIImageView *profilePic;
@property(nonatomic, weak) IBOutlet UILabel *deviceName;
@property (nonatomic,weak) IBOutlet UILabel *signalStrength;
@property (weak, nonatomic) IBOutlet UILabel *deviceProfile;
@property (weak, nonatomic) IBOutlet UILabel *connectionDuration;
@property (weak, nonatomic) IBOutlet UILabel *dlSpeed;
@property (weak, nonatomic) IBOutlet UILabel *ulSpeed;
@property (weak, nonatomic) IBOutlet UILabel *totalUsagePercentage;

@end
