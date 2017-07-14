//
//  InternetConncetionViewController.m
//  Vayuyan
//
//  Created by sujith on 4/7/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "InternetConncetionViewController.h"

@interface InternetConncetionViewController ()

@end

@implementation InternetConncetionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *months = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun"];
    NSArray *unitsSold = @[@20.0,@60.0,@145.0,@100.0,@120.0,@200.0];
    NSArray *uploadDataArray = @[@4.0,@16.0,@2.1,@25.0,@12.0,@6.0];

    [self drawDownloadSpeedGraph:months second:unitsSold ];
    [self drawUploadSpeedGraph:months second:uploadDataArray ];
    [self drawScatterGraph:7 second:10.0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) drawDownloadSpeedGraph:(NSArray *)dataPoints second:(NSArray *)values {
    NSMutableArray *dataEntries=[[NSMutableArray alloc] init];
    
    for (int i=0; i<dataPoints.count; i++) {
        ChartDataEntry *k = [[ChartDataEntry alloc] initWithX:i y:[values[i] doubleValue]];
        [dataEntries addObject:k];
        NSLog(@"************************************%@",k);
    }
    
    NSArray *months = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun"];

    
    LineChartDataSet *l =[[LineChartDataSet alloc] initWithValues:dataEntries label:@"months"];
    l.lineWidth = 3;
    l.mode = LineChartModeCubicBezier;
    l.drawCirclesEnabled = NO;
    l.drawValuesEnabled = NO;
    l.colors = @[[UIColor colorWithRed:86/255.0 green:193/255.0 blue:121/255.0 alpha:1]];
    NSLog(@"#######################%@",l);
    LineChartData *lc = [[LineChartData alloc] initWithDataSet: l];
    NSLog(@"#######################%@",lc);
    
    [_downloadSpeedChart setData:lc];
    

    NSNumber *max=[values valueForKeyPath:@"@max.doubleValue"];
    NSNumber *min=[values valueForKeyPath:@"@min.doubleValue"];
    
    _downloadSpeedChart.userInteractionEnabled = false;
    _downloadSpeedChart.rightAxis.enabled = true;
    _downloadSpeedChart.rightAxis.axisLineColor = [UIColor whiteColor];
    _downloadSpeedChart.leftAxis.enabled  = false;
    _downloadSpeedChart.xAxis.enabled = true;
    _downloadSpeedChart.legend.enabled = false;
    
    _downloadSpeedChart.rightAxis.drawGridLinesEnabled = false;
    _downloadSpeedChart.leftAxis.drawGridLinesEnabled = false;
    _downloadSpeedChart.leftAxis.drawLabelsEnabled = false;
    _downloadSpeedChart.xAxis.drawLabelsEnabled = false;
    _downloadSpeedChart.descriptionText = @"";
    
    _downloadSpeedChart.xAxis.drawGridLinesEnabled = YES;
    [_downloadSpeedChart.xAxis setGridColor: [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0]];
    _downloadSpeedChart.xAxis.gridLineWidth = 1.5;
    _downloadSpeedChart.xAxis.axisLineColor = [UIColor whiteColor];
    
    
    
    [_downloadSpeedChart.rightAxis setLabelCount:2 force:YES];
    _downloadSpeedChart.rightAxis.granularityEnabled = true;
    _downloadSpeedChart.rightAxis.axisMinValue = 0.0;
    _downloadSpeedChart.rightAxis.granularity = 100;
    _downloadSpeedChart.rightAxis.labelFont = [UIFont systemFontOfSize:10.0f];
    _downloadSpeedChart.rightAxis.labelTextColor=[UIColor lightGrayColor];
    
    
    
    
    // y limitlines
    
    ChartYAxis * dy = _downloadSpeedChart.rightAxis ;
    dy.drawLimitLinesBehindDataEnabled = true;
    ChartLimitLine *dell = [[ChartLimitLine alloc] initWithLimit:150.0];
    ChartLimitLine *dall = [[ChartLimitLine alloc] initWithLimit:110.0];
    
    [dy addLimitLine:dell];
    [dy addLimitLine:dall];
    
    dell.lineColor = [UIColor colorWithRed:86/255.0 green:193/255.0 blue:121/255.0 alpha:1];
    dell.lineDashLengths = @[@2.5,@2.5];
    dell.lineColor = [UIColor blackColor];
    dell.lineDashLengths = @[@2.5,@2.5];
    dell.lineWidth = 1;
    dall.lineWidth = 1;

    dall.lineColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
    
    
    
    //NSLog(@"download limitline limit is ****** %f\n",dell.limit);
    NSLog(@"range is is ****** %f",_downloadSpeedChart.xRange);
    
    NSLog(@"range is is ****** %f",_downloadSpeedChart.scaleY);
    
    /*
     CAShapeLayer *circle = [CAShapeLayer layer];
     circle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.uploadSpeedChart.frame.size.width+67,89, 10, 10)].CGPath;
     circle.fillColor = [UIColor blackColor].CGColor;
     [ [self.uploadSpeedChart layer] addSublayer:circle];
     
     
     CAShapeLayer *circle1 = [CAShapeLayer layer];
     circle1.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.uploadSpeedChart.frame.size.width+67,189, 10, 10)].CGPath;
     circle1.fillColor = [UIColor orangeColor].CGColor;
     [ [self.uploadSpeedChart layer] addSublayer:circle1];
     */
    
    [_uploadSpeedChart notifyDataSetChanged];

    
    
}

-(void) drawUploadSpeedGraph:(NSArray *)dataPoints second:(NSArray *)values {
    NSMutableArray *dataEntries=[[NSMutableArray alloc] init];
    
    for (int i=0; i<dataPoints.count; i++) {
        ChartDataEntry *k = [[ChartDataEntry alloc] initWithX:i y:[values[i] doubleValue]];
        [dataEntries addObject:k];
    }
    
    NSArray *months = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun"];
    
    LineChartDataSet *l =[[LineChartDataSet alloc] initWithValues:dataEntries label:@"months"];
    l.lineWidth = 3;
    l.mode = LineChartModeCubicBezier;
    l.drawCirclesEnabled = NO;
    l.drawValuesEnabled = NO;
    l.colors = @[[UIColor colorWithRed:255/255.0 green:130/255.0 blue:67/255.0 alpha:1]];
    
    LineChartData *lc = [[LineChartData alloc] initWithDataSet: l];
    [_uploadSpeedChart setData:lc];
    //NSNumber *maxUploadSpeed=[values valueForKeyPath:@"@max.self"];
    //NSNumber *minUploadSpeed=[values valueForKeyPath:@"@min.self"];
    
    NSNumber *max=[values valueForKeyPath:@"@max.doubleValue"];
    NSNumber *min=[values valueForKeyPath:@"@min.doubleValue"];
    
    _uploadSpeedChart.userInteractionEnabled = false;
    _uploadSpeedChart.rightAxis.enabled = true;
    _uploadSpeedChart.rightAxis.axisLineColor = [UIColor whiteColor];
    _uploadSpeedChart.leftAxis.enabled  = false;
    _uploadSpeedChart.xAxis.enabled = true;
    _uploadSpeedChart.legend.enabled = false;
    
    _uploadSpeedChart.rightAxis.drawGridLinesEnabled = false;
    _uploadSpeedChart.leftAxis.drawGridLinesEnabled = false;
    _uploadSpeedChart.leftAxis.drawLabelsEnabled = false;
    _uploadSpeedChart.xAxis.drawLabelsEnabled = false;
    _uploadSpeedChart.descriptionText = @"";
    
    _uploadSpeedChart.xAxis.drawGridLinesEnabled = YES;
    [_uploadSpeedChart.xAxis setGridColor: [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0]];
    _uploadSpeedChart.xAxis.gridLineWidth = 1.5;
    _uploadSpeedChart.xAxis.axisLineColor = [UIColor whiteColor];
    
    
    
    [_uploadSpeedChart.rightAxis setLabelCount:2 force:YES];
    _uploadSpeedChart.rightAxis.granularityEnabled = true;
    _uploadSpeedChart.rightAxis.axisMinValue = 0.0;
    _uploadSpeedChart.rightAxis.granularity = 20;
    _uploadSpeedChart.rightAxis.labelFont = [UIFont systemFontOfSize:10.0f];
    _uploadSpeedChart.rightAxis.labelTextColor=[UIColor lightGrayColor];
    
    
    
    
    // y limitlines
    _uploadSpeedChart.rightAxis.drawLimitLinesBehindDataEnabled = YES;
    ChartYAxis * y = _uploadSpeedChart.rightAxis;
    y.drawLimitLinesBehindDataEnabled = true;
    ChartLimitLine *all = [[ChartLimitLine alloc] initWithLimit:11.2];
    ChartLimitLine *ell = [[ChartLimitLine alloc] initWithLimit:20.0];
    [y addLimitLine:all];
    [y addLimitLine:ell];
    all.lineWidth = 1;
    ell.lineWidth = 1;
    all.lineDashLengths = @[@2.5,@2.5];
    ell.lineDashLengths = @[@2.5,@2.5];
    
    
    all.lineColor = [UIColor colorWithRed:255/255.0 green:130/255.0 blue:67/255.0 alpha:1];
    ell.lineColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:1.0];
    NSLog(@"limitline limit is ****** %f\n",ell.limit);
    NSLog(@"range is is ****** %f",_uploadSpeedChart.xRange);
    
    NSLog(@"range is is ****** %f",_uploadSpeedChart.scaleY);
    
    /*
    CAShapeLayer *circle = [CAShapeLayer layer];
    circle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.uploadSpeedChart.frame.size.width+67,89, 10, 10)].CGPath;
    circle.fillColor = [UIColor blackColor].CGColor;
    [ [self.uploadSpeedChart layer] addSublayer:circle];
    
    
    CAShapeLayer *circle1 = [CAShapeLayer layer];
    circle1.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.uploadSpeedChart.frame.size.width+67,189, 10, 10)].CGPath;
    circle1.fillColor = [UIColor orangeColor].CGColor;
    [ [self.uploadSpeedChart layer] addSublayer:circle1];
    */
    
    
    
    [_uploadSpeedChart notifyDataSetChanged];
}

-(void) drawScatterGraph:(int)count second:(double )range {
    
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];

    
    for (int i = 0; i < count; i++)
    {
        
        [yVals1 addObject:[[ChartDataEntry alloc] initWithX:(i+5) y:10.0]];
        [yVals2 addObject:[[ChartDataEntry alloc] initWithX:(20) y:20.0]];

    
    }
    
    ScatterChartDataSet *set1 = [[ScatterChartDataSet alloc] initWithValues:yVals1 label:@"months"];
    [set1 setScatterShape:ScatterShapeSquare];
    [set1 setColor:[UIColor colorWithRed:255/255.0 green:130/255.0 blue:67/255.0 alpha:1]];
    set1.drawValuesEnabled = false;
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    [dataSets addObject:set1];
    
    _availabilityScatterChart.extraLeftOffset = 10.0f;
    _availabilityScatterChart.extraRightOffset= 10.0f;
    ScatterChartData *data = [[ScatterChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont fontWithName:@"AktivGrotesk-Regular" size:10.f]];
    
    _availabilityScatterChart.data = data;
    
    _availabilityScatterChart.chartDescription.enabled = NO;
    
    _availabilityScatterChart.drawGridBackgroundEnabled = YES;
    _availabilityScatterChart.dragEnabled = false;
    [_availabilityScatterChart setScaleEnabled:false];
    _availabilityScatterChart.maxVisibleCount = 100;
    _availabilityScatterChart.pinchZoomEnabled = false;
    _availabilityScatterChart.legend.enabled = false;
    

 
      _availabilityScatterChart.xAxis.drawLabelsEnabled = true;
    _availabilityScatterChart.xAxis.labelPosition = 1;
    _availabilityScatterChart.xAxis.drawGridLinesEnabled = false;
    _availabilityScatterChart.leftAxis.enabled = NO;
    _availabilityScatterChart.rightAxis.enabled = NO;
    _availabilityScatterChart.gridBackgroundColor = [UIColor whiteColor];
    ChartXAxis *xl = _availabilityScatterChart.xAxis;
    xl.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.f];
    xl.drawGridLinesEnabled = NO;
   
    [_availabilityScatterChart notifyDataSetChanged];
    
}


- (IBAction)backToAnalyticsScreen:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end



