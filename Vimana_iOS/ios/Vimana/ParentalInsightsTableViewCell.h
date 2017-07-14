//
//  ParentalInsightsTableViewCell.h
//  Vayuyan
//
//  Created by sujith on 4/6/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParentalInsightsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceLabel;
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
