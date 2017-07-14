//
//  IoTAllDevicesCell.m
//  Vayuyan
//
//  Created by sujith on 3/21/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "IoTAllDevicesCell.h"

@implementation IoTAllDevicesCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _allDeviceButton.layer.cornerRadius =_allDeviceButton.layer.frame.size.height/2;
    UIImage *btnImage = [UIImage imageNamed:@"OFF_Button"];
    [_allDeviceButton setImage:btnImage forState:UIControlStateNormal];
    _allDevicesDeviceImage.layer.cornerRadius = _allDevicesDeviceImage.layer.frame.size.height;
  

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)allDeviceButtonTapped:(id)sender {
    
    if ([sender isSelected]) {
        [sender setImage:[UIImage imageNamed:@"ON_Button"] forState:UIControlStateNormal];
        [sender setSelected:NO];
    } else {
        [sender setImage:[UIImage imageNamed:@"OFF_Button"] forState:UIControlStateSelected];
        [sender setSelected:YES];
    }

}
@end
