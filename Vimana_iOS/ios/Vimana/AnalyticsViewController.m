//
//  AnalyticsViewController.m
//  Vayuyan
//
//  Created by suryateja on 3/31/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "AnalyticsViewController.h"
#import "SentimentAnalysisViewController.h"
#import "ParentalInsightsViewController.h"
#import "DataUsageViewController.h"
#import "AnalyticsPageViewController.h"
@interface AnalyticsViewController ()

@end

@implementation AnalyticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *months = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun"];
    NSArray *unitsSold = @[@4.0,@16.0,@0.0,@100.0,@12.0,@6.0];
    [self setDownloadChart:months second:unitsSold ];
    [self setUploadChart:months second:unitsSold];
    NSArray *data = @[@36.2,@19.6,@9, @4.8, @3.6, @2.4, @2.4,@1.8,@0.9,@19.6];
    [self drawSentimentAnalysisBar:months second:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setDownloadChart:(NSArray *)dataPoints second:(NSArray *)values {
    NSMutableArray *dataEntries=[[NSMutableArray alloc] init];
    
    for (int i=0; i<dataPoints.count; i++) {
        ChartDataEntry *k = [[ChartDataEntry alloc] initWithX:i y:[values[i] doubleValue]];
        [dataEntries addObject:k];
        NSLog(@"************************************%@",k);
    }
    
    
    LineChartDataSet *l =[[LineChartDataSet alloc] initWithValues:dataEntries label:@"UnitsSold"];
    l.lineWidth = 3;
    l.mode = LineChartModeCubicBezier;
    l.drawCirclesEnabled = NO;
    l.drawValuesEnabled = NO;
    l.colors = @[[UIColor colorWithRed:86/255.0 green:193/255.0 blue:121/255.0 alpha:1]];
    NSLog(@"#######################%@",l);
    LineChartData *lc = [[LineChartData alloc] initWithDataSet: l];
    NSLog(@"#######################%@",lc);
    
    [_downloadSpeedView setData:lc];

    _downloadSpeedView.leftAxis.drawLabelsEnabled = false;
    _downloadSpeedView.leftAxis.drawGridLinesEnabled=false;
    _downloadSpeedView.rightAxis.drawLabelsEnabled = false;
    _downloadSpeedView.rightAxis.drawGridLinesEnabled=false;
    
    _downloadSpeedView.xAxis.drawGridLinesEnabled=false;
    _downloadSpeedView.xAxis.drawLabelsEnabled=false;
    
    _downloadSpeedView.legend.enabled = false;
    _downloadSpeedView.xAxis.enabled=false;
    _downloadSpeedView.leftAxis.enabled=false;
    _downloadSpeedView.rightAxis.enabled=false;
    
    _downloadSpeedView.userInteractionEnabled = false;
    _downloadSpeedView.descriptionText = @"";
    

    
    
}
    -(void) setUploadChart:(NSArray *)dataPoints second:(NSArray *)values {
        NSMutableArray *dataEntries=[[NSMutableArray alloc] init];
        
        for (int i=0; i<dataPoints.count; i++) {
            ChartDataEntry *k = [[ChartDataEntry alloc] initWithX:i y:[values[i] doubleValue]];
            [dataEntries addObject:k];
            NSLog(@"************************************%@",k);
        }
        
        
        LineChartDataSet *l =[[LineChartDataSet alloc] initWithValues:dataEntries label:@"UnitsSold"];
        l.lineWidth = 3;
        l.mode = LineChartModeCubicBezier;
        l.drawCirclesEnabled = NO;
        l.drawValuesEnabled = NO;
        l.colors = @[[UIColor colorWithRed:255/255.0 green:130/255.0 blue:67/255.0 alpha:1]];
        NSLog(@"#######################%@",l);
        LineChartData *lc = [[LineChartData alloc] initWithDataSet: l];
        NSLog(@"#######################%@",lc);
        
        
        [_uploadSpeedView setData:lc];
        
        _uploadSpeedView.leftAxis.drawLabelsEnabled = false;
        _uploadSpeedView.leftAxis.drawGridLinesEnabled=false;
        _uploadSpeedView.rightAxis.drawLabelsEnabled = false;
        _uploadSpeedView.rightAxis.drawGridLinesEnabled=false;
        
        _uploadSpeedView.xAxis.drawGridLinesEnabled=false;
        _uploadSpeedView.xAxis.drawLabelsEnabled=false;
        
        _uploadSpeedView.legend.enabled = false;
        _uploadSpeedView.xAxis.enabled=false;
        _uploadSpeedView.leftAxis.enabled=false;
        _uploadSpeedView.rightAxis.enabled=false;
        
        _uploadSpeedView.userInteractionEnabled = false;
        _uploadSpeedView.descriptionText = @"";
        
        
    }


-(void) drawSentimentAnalysisBar:(NSArray *)dataPoints second:(NSArray *)values {

    NSMutableArray *yValues = [NSMutableArray array];
    [yValues addObject:[[BarChartDataEntry alloc] initWithX:5 yValues:values]];
    
    BarChartDataSet *set = nil;
    if (_sentimentAnalysisBar.data.dataSetCount > 0)
    {
        set = (BarChartDataSet *)_sentimentAnalysisBar.data.dataSets[0];
        set.values = yValues;
        [_sentimentAnalysisBar.data notifyDataChanged];
        [_sentimentAnalysisBar notifyDataSetChanged];
    }
    else
    {
        NSNumberFormatter *customFormatter = [[NSNumberFormatter alloc] init];
        customFormatter.negativePrefix = @"";
        customFormatter.positiveSuffix = @"m";
        customFormatter.negativeSuffix = @"m";
        customFormatter.minimumSignificantDigits = 1;
        customFormatter.minimumFractionDigits = 1;
        
        set = [[BarChartDataSet alloc] initWithValues:yValues label:@"Age Distribution"];
        
        set.drawIconsEnabled = NO;
        
        set.valueFormatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:customFormatter];
        set.valueFont = [UIFont systemFontOfSize:7.f];
        set.axisDependency = AxisDependencyRight;
        set.colors = @[
                       [UIColor colorWithRed:79.0/255.f green:122/255.f blue:166/255.f alpha:1.f],
                       [UIColor colorWithRed:240/255.f green:142/255.f blue:57/255.f alpha:1.f],
                       [UIColor colorWithRed:223/255.f green:88/255.f blue:100/255.f alpha:1.f],                       [UIColor colorWithRed:120/255.f green:183/255.f blue:178/255.f alpha:1.f],
                       [UIColor colorWithRed:155/255.f green:117/255.f blue:97/255.f alpha:1.f],
                       [UIColor colorWithRed:253/255.f green:158/255.f blue:169/255.f alpha:1.f],
                       [UIColor colorWithRed:175/255.f green:123/255.f blue:161/255.f alpha:1.f],
                       [UIColor colorWithRed:236/255.f green:200/255.f blue:84/255.f alpha:1.f],
                       [UIColor colorWithRed:91/255.f green:160/255.f blue:82/255.f alpha:1.f],[UIColor colorWithRed:203/255.f green:203/255.f blue:203/255.f alpha:1.f]
                       ];
        BarChartData *data = [[BarChartData alloc] initWithDataSet:set];
        
        data.barWidth = 8.5;
        
        _sentimentAnalysisBar.data = data;
        
        _sentimentAnalysisBar.leftAxis.drawLabelsEnabled = false;
        _sentimentAnalysisBar.leftAxis.drawGridLinesEnabled=false;
        _sentimentAnalysisBar.rightAxis.drawLabelsEnabled = false;
        _sentimentAnalysisBar.rightAxis.drawGridLinesEnabled=false;
        
        _sentimentAnalysisBar.xAxis.drawGridLinesEnabled=false;
        _sentimentAnalysisBar.xAxis.drawLabelsEnabled=false;
        
        _sentimentAnalysisBar.legend.enabled = false;
        _sentimentAnalysisBar.xAxis.enabled=false;
        _sentimentAnalysisBar.leftAxis.enabled=false;
        _sentimentAnalysisBar.rightAxis.enabled=false;
        
        _sentimentAnalysisBar.userInteractionEnabled = false;
        _sentimentAnalysisBar.descriptionText = @"";
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)handleTapToSentimentAnalysisAction:(id)sender {
    
    SentimentAnalysisViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SentimentAnalysisController"];
    [self presentViewController:vc animated:NO completion:nil];
    
    
}
- (IBAction)handleTapToParentalInsightsScreen:(id)sender {
    
    ParentalInsightsViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"ParentalInsightsController"];
    [self presentViewController:vc1 animated:NO completion:nil];;
}
- (IBAction)handleTapToDataUsageScreen:(id)sender {
    
    DataUsageViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"DataUsageController"];
    [self presentViewController:vc2 animated:NO completion:nil];;

}
- (IBAction)HandleTapToInternetConnection:(id)sender {
    
    AnalyticsPageViewController *apvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AnalyticsPageViewController"];
     [self presentViewController:apvc animated:NO completion:nil];;
    
}
@end
