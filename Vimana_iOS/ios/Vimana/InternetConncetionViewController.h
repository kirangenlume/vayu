//
//  InternetConncetionViewController.h
//  Vayuyan
//
//  Created by sujith on 4/7/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vayuyan-Swift.h"
@import Charts;

@interface InternetConncetionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *downloadSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *expectedDownloadSpeedLabel;
@property (weak, nonatomic) IBOutlet LineChartView *downloadSpeedChart;
@property (weak, nonatomic) IBOutlet UILabel *uploadSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *expecteduploadSpeedLabel;
@property (weak, nonatomic) IBOutlet LineChartView *uploadSpeedChart;
@property (weak, nonatomic) IBOutlet UILabel *availabilityPercentLabel;
@property (weak, nonatomic) IBOutlet ScatterChartView *availabilityScatterChart;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backToAnalyticsScreen:(id)sender;

@end
