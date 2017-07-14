//
//  IoTGroupedDevicesCell.h
//  Vayuyan
//
//  Created by sujith on 3/21/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IoTGroupedDevicesCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *groupedCellDeviceImage;
@property (weak, nonatomic) IBOutlet UILabel *groupedCellIoTLabel;
@property (weak,nonatomic)  IBOutlet  UILabel *groupedCellIoTDeivcesLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupedCellDeviceCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *groupedCellButton;
- (IBAction)groupedCellButtonTapped:(id)sender;

@property(nonatomic) NSArray *groupedCellIotImageArray;
@end
