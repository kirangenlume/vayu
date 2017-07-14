//
//  DataUsageTableViewCell.m
//  Vayuyan
//
//  Created by sujith on 4/6/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "DataUsageTableViewCell.h"

@implementation DataUsageTableViewCell

@synthesize dataUsageLabel;
@synthesize dataUsageWebsiteLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
