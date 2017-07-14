//
//  DataUsageViewController.m
//  Vayuyan
//
//  Created by sujith on 4/6/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "DataUsageViewController.h"
#import "DZNSegmentedControl.h"
#import "DataUsageTableViewCell.h"

NSArray *dataUsageWebsitesArray;
NSArray *dataUsageArray;
NSArray *uploadDataArray;

@interface DataUsageViewController ()<UITabBarDelegate,UITableViewDataSource,DZNSegmentedControlDelegate>
@property NSArray* dataUsageSegmentBarItems;
@property(nonatomic) DZNSegmentedControl *dataUsageSegmentBar;
@property DataUsageTableViewCell *dataUsageTableCell;
@end

@implementation DataUsageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *days = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun"];
    dataUsageWebsitesArray = @[@"youtube.com",@"facebook.com",@"netflix.com",@"valve.software",@"pininterest.com",@"nest.com",@"skype.com",@"twitter.com",@"watsapp",@"apple.com",@"Others"];
    dataUsageArray=@[@"42.9",@"21.2",@"9.5",@"7.4",@"6.3",@"5.3",@"4.2",@"4.2",@"3.1",@"2.2",@"56.7"];
    uploadDataArray = @[@"2.9",@"5.2",@"1.5",@"1.4",@"0.3",@"0.3",@"1.2",@"0.2",@"3.1",@"2.2",@"30.3"];
    
    NSArray *Totaldata = @[@91.4,@8.6];
    [self drawDownloadUploadBar:days second:Totaldata];

    
    _dataUsageSegmentBarItems = @[@"By Websites",@"By Devices",@"By Users"];
    _dataUsageSegmentBar = [[DZNSegmentedControl alloc] initWithItems:_dataUsageSegmentBarItems];
    _dataUsageSegmentBar.tintColor = [UIColor colorWithRed:0 green:176/255.0 blue:185/255.0 alpha:1];
    _dataUsageSegmentBar.showsGroupingSeparators = YES;
    _dataUsageSegmentBar.autoAdjustSelectionIndicatorWidth = YES;
    _dataUsageSegmentBar.hairlineColor =[UIColor whiteColor];
   _dataUsageSegmentBar.height = 32;
    _dataUsageSegmentBar.layer.frame = CGRectMake(0, 197, self.view.frame.size.width/2, 30);
    
    [_dataUsageSegmentBar addTarget:self action:@selector(didChangedataUsageSegment:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_dataUsageSegmentBar];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return   10;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 NSString *dataUsageCellIdentifier = @"DataUsageCellIdentifier";
    DataUsageTableViewCell *dataUsageCell = (DataUsageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:dataUsageCellIdentifier];
    if(dataUsageCell == nil){
    
        dataUsageCell = [[DataUsageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dataUsageCellIdentifier];
    }
    dataUsageCell.dataUsageWebsiteLabel.text = [dataUsageWebsitesArray objectAtIndex:indexPath.row];
    dataUsageCell.dataUsageLabel.text = [dataUsageArray objectAtIndex:indexPath.row];
        
    return dataUsageCell;
    
}



-(void) drawDownloadUploadBar:(NSArray *)dataPoints second:(NSArray *)values {
    
    NSMutableArray *yValues = [NSMutableArray array];
    [yValues addObject:[[BarChartDataEntry alloc] initWithX:5 yValues:values]];
    
    BarChartDataSet *set = nil;
    if (_downloadUploadDataStackBar.data.dataSetCount > 0)
    {
        set = (BarChartDataSet *)_downloadUploadDataStackBar.data.dataSets[0];
        set.values = yValues;
        [_downloadUploadDataStackBar.data notifyDataChanged];
        [_downloadUploadDataStackBar notifyDataSetChanged];
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
                       [UIColor colorWithRed:63.0/255.f green:179/255.f blue:231/255.f alpha:1.f],
                       [UIColor colorWithRed:68/255.f green:101/255.f blue:153/255.f alpha:1.f],
                       ];
        BarChartData *data = [[BarChartData alloc] initWithDataSet:set];
        
        data.barWidth = 8.5;
        
        _downloadUploadDataStackBar.data = data;
        
        _downloadUploadDataStackBar.leftAxis.drawLabelsEnabled = false;
        _downloadUploadDataStackBar.leftAxis.drawGridLinesEnabled=false;
        _downloadUploadDataStackBar.rightAxis.drawLabelsEnabled = false;
        _downloadUploadDataStackBar.rightAxis.drawGridLinesEnabled=false;
        
        _downloadUploadDataStackBar.xAxis.drawGridLinesEnabled=false;
        _downloadUploadDataStackBar.xAxis.drawLabelsEnabled=false;
        
        _downloadUploadDataStackBar.legend.enabled = false;
        _downloadUploadDataStackBar.xAxis.enabled=false;
        _downloadUploadDataStackBar.leftAxis.enabled=false;
        _downloadUploadDataStackBar.rightAxis.enabled=false;
        
        _downloadUploadDataStackBar.userInteractionEnabled = false;
        _downloadUploadDataStackBar.descriptionText = @"";
    }
    
}

/*-(void) drawDownloadUploadBarInCell:(NSArray *)dataPoints second:(NSArray *)values {
    
    
    NSMutableArray *yValues = [NSMutableArray array];
    [yValues addObject:[[BarChartDataEntry alloc] initWithX:5 yValues:values]];
    
    BarChartDataSet *set = nil;
    if (_dataUsageTableCell.websiteDataUsageStackBar.data.dataSetCount > 0)
    {
        set = (BarChartDataSet *)_downloadUploadDataStackBar.data.dataSets[0];
        set.values = yValues;
        [_dataUsageTableCell.websiteDataUsageStackBar.data notifyDataChanged];
        [_dataUsageTableCell.websiteDataUsageStackBar notifyDataSetChanged];
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
                       [UIColor colorWithRed:63.0/255.f green:179/255.f blue:231/255.f alpha:1.f],
                       [UIColor colorWithRed:68/255.f green:101/255.f blue:153/255.f alpha:1.f],
                       ];
        BarChartData *data = [[BarChartData alloc] initWithDataSet:set];
        
        data.barWidth = 8.5;
        
        _dataUsageTableCell.websiteDataUsageStackBar.data = data;
        
        _dataUsageTableCell.websiteDataUsageStackBar.leftAxis.drawLabelsEnabled = false;
        _dataUsageTableCell.websiteDataUsageStackBar.leftAxis.drawGridLinesEnabled=false;
        _dataUsageTableCell.websiteDataUsageStackBar.rightAxis.drawLabelsEnabled = false;
        _dataUsageTableCell.websiteDataUsageStackBar.rightAxis.drawGridLinesEnabled=false;
        
        _dataUsageTableCell.websiteDataUsageStackBar.xAxis.drawGridLinesEnabled=false;
        _dataUsageTableCell.websiteDataUsageStackBar.xAxis.drawLabelsEnabled=false;
        
        _dataUsageTableCell.websiteDataUsageStackBar.legend.enabled = false;
        _dataUsageTableCell.websiteDataUsageStackBar.xAxis.enabled=false;
        _dataUsageTableCell.websiteDataUsageStackBar.leftAxis.enabled=false;
        _dataUsageTableCell.websiteDataUsageStackBar.rightAxis.enabled=false;
        
        _dataUsageTableCell.websiteDataUsageStackBar.userInteractionEnabled = false;
        _dataUsageTableCell.websiteDataUsageStackBar.descriptionText = @"";
    }

}*/

-(void)didChangedataUsageSegment:(DZNSegmentedControl *)parentalInsightsBar{
    
    
    
}
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionAny;
}

- (UIBarPosition)positionForSelectionIndicator:(id<UIBarPositioning>)bar
{
    return UIBarPositionAny;
}
- (IBAction)handleBacKButtonAction:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
