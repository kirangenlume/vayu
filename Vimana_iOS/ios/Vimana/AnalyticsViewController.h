//
//  AnalyticsViewController.h
//  Vayuyan
//
//  Created by suryateja on 3/31/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vayuyan-Swift.h"
@import Charts;
@interface AnalyticsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *downloadSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *uploadSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *availabilityLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalDataUsageLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadedDataUsageLabel;
@property (weak, nonatomic) IBOutlet UILabel *uploadedDataUsageLabel;


@property (weak, nonatomic) IBOutlet UILabel *blockedWebsitesLabel;
@property (weak, nonatomic) IBOutlet UILabel *sensitiveSearchesLabel;



@property (weak, nonatomic) IBOutlet UILabel *mostPopularSearchCategoryLabel;



@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapToInternetConnectionScreen;

- (IBAction)HandleTapToInternetConnection:(id)sender;



@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapToSentimentAnalysisScreen;
- (IBAction)handleTapToSentimentAnalysisAction:(id)sender;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapToParentalInsightsScreen;
- (IBAction)handleTapToParentalInsightsScreen:(id)sender;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapToDataUsageScreen;
- (IBAction)handleTapToDataUsageScreen:(id)sender;

@property (weak, nonatomic) IBOutlet LineChartView *downloadSpeedView;
@property (weak, nonatomic) IBOutlet LineChartView *uploadSpeedView;
@property (weak, nonatomic) IBOutlet HorizontalBarChartView *sentimentAnalysisBar;

    
@end
