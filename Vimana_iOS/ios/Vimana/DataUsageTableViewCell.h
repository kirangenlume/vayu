//
//  DataUsageTableViewCell.h
//  Vayuyan
//
//  Created by sujith on 4/6/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vayuyan-Swift.h"
@import Charts;


@interface DataUsageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dataUsageWebsiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataUsageLabel;
@property (strong, nonatomic) IBOutlet HorizontalBarChartView *websiteDataUsageStackBar;

@end
