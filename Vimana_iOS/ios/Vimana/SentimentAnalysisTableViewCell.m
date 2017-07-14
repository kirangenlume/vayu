//
//  SentimentAnalysisTableViewCell.m
//  Vayuyan
//
//  Created by sujith on 4/5/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "SentimentAnalysisTableViewCell.h"

@implementation SentimentAnalysisTableViewCell

@synthesize searchCategoryImage;
@synthesize searchCategoryPercentage;
@synthesize searchCategoryLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
