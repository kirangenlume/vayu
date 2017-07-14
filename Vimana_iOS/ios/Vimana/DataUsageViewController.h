//
//  DataUsageViewController.h
//  Vayuyan
//
//  Created by sujith on 4/6/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vayuyan-Swift.h"
@import Charts;

@interface DataUsageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *totalDataUsageLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadedDataUsageLabel;
@property (weak, nonatomic) IBOutlet UILabel *uploadedDataUsageLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentDownloadedUsageLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentUploadUsageLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)handleBacKButtonAction:(id)sender;
@property (weak,nonatomic) IBOutlet HorizontalBarChartView* downloadUploadDataStackBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
