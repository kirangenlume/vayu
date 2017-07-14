//
//  IoTGroupedDevicesCell.m
//  Vayuyan
//
//  Created by sujith on 3/21/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "IoTGroupedDevicesCell.h"

@implementation IoTGroupedDevicesCell
    
    
    @synthesize groupedCellIoTLabel;
    @synthesize groupedCellIoTDeivcesLabel;
    @synthesize groupedCellDeviceCountLabel;
    @synthesize groupedCellDeviceImage;

    
    
- (void)awakeFromNib {
    [super awakeFromNib];
    _groupedCellButton.layer.cornerRadius = _groupedCellButton.layer.frame.size.height/2;
    
    UIImage *btnImage = [UIImage imageNamed:@"ON_Button"];
    [_groupedCellButton setImage:btnImage forState:UIControlStateNormal];
    
    groupedCellDeviceImage.layer.cornerRadius = groupedCellDeviceImage.layer.frame.size.height/2;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)groupedCellButtonTapped:(id)sender {
    _groupedCellIotImageArray = @[@"ON_Button",@"OFF_Button",@"DoorUnlocked"];
    
    if ([groupedCellIoTLabel.text containsString:@"Lock"]) {
    
    if ([sender isSelected]) {
        [sender setImage:[UIImage imageNamed:@"DoorLocked"] forState:UIControlStateNormal];
        [sender setSelected:NO];
    } else {
        [sender setImage:[UIImage imageNamed:@"DoorUnlocked"] forState:UIControlStateSelected];
        [sender setSelected:YES];
    }
    }
    else{
    if ([sender isSelected]) {
        [sender setImage:[UIImage imageNamed:@"ON_Button"] forState:UIControlStateNormal];
        [sender setSelected:NO];
    } else {
        [sender setImage:[UIImage imageNamed:@"OFF_Button"] forState:UIControlStateSelected];
        [sender setSelected:YES];
    }
    }
}
@end
