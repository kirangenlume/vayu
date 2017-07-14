//
//  DevicesScreenTableViewCell.m
//  Vimana_DevicesScreenR&D
//
//  Created by suryateja on 3/6/17.
//  Copyright © 2017 ENLUME. All rights reserved.
//

#import "DevicesScreenTableViewCell.h"

@implementation DevicesScreenTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void) layoutSubviews{
    [super layoutSubviews];
    _profilePic.layer.cornerRadius=_profilePic.frame.size.width/2;
    _profilePic.clipsToBounds=YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
