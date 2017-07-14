//
//  SentimentAnalysisTableViewCell.h
//  Vayuyan
//
//  Created by sujith on 4/5/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SentimentAnalysisTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *searchCategoryImage;
@property (weak, nonatomic) IBOutlet UILabel *searchCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchCategoryPercentage;

@end
