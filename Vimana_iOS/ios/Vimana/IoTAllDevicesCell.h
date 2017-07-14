//
//  IoTAllDevicesCell.h
//  Vayuyan
//
//  Created by sujith on 3/21/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IoTAllDevicesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *allDevicesDeviceImage;
@property (weak,nonatomic)  IBOutlet UILabel *allDeviceIoTLabel;
@property (weak,nonatomic)  IBOutlet UILabel *allDeviceSignalStrengthLabel;
@property (weak,nonatomic)  IBOutlet UIButton *allDeviceButton;
@property (weak,nonatomic)  IBOutlet UIImageView *allDeviceSignalStrengthImage;
- (IBAction)allDeviceButtonTapped:(id)sender;

@end
