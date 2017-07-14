//
//  DevicesMappingTableViewCell.m
//  Vayuyan
//
//  Created by kirang on 3/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "DevicesMappingTableViewCell.h"

@implementation DevicesMappingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _circleview = [[CustomView alloc] initWithFrame:CGRectMake(-25,50, self.contentView.frame.size.width, 250)];
    [_circleview center];
    _circleview.firstColor = [UIColor colorWithRed:(250.0/255.0) green:(250.0/255.0) blue:(251.0/255.0) alpha:0.25];
    _circleview.secondColor = [UIColor colorWithRed:(250.0/255.0) green:(250.0/255.0) blue:(251.0/255.0) alpha:0.25];
    _circleview.thirdColor = [UIColor colorWithRed:(250.0/255.0) green:(250.0/255.0) blue:(251.0/255.0) alpha:0.25];
    //[self.contentView addSubview:_circleview];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
