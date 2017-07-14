//
//  ToggleWiFiTableViewCell.h
//  Vayuyan
//
//  Created by suryateja on 3/28/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToggleWiFiTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *toggleWiFiLabel;
@property (weak, nonatomic) IBOutlet UIImageView *toggleWiFiImage;
@property (weak, nonatomic) IBOutlet UISwitch *toggleWiFiSwitch;

@end
