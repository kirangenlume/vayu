//
//  SentimentAnalysisViewController.m
//  Vayuyan
//
//  Created by sujith on 4/5/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "SentimentAnalysisViewController.h"
#import "SentimentAnalysisTableViewCell.h"
#import "AnalyticsViewController.h"
@import Charts;

@interface SentimentAnalysisViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic) IBOutlet HorizontalBarChartView *sentimentBar;
@property NSArray *searchCategoriesArray;
@property NSArray *searchCategoriesColoursArray;
@property NSArray *searchCategoriesPercentUsageArray;



@end

@implementation SentimentAnalysisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchCategoriesArray = @[@"Technology",@"Music",@"Fashion",@"Beauty",@"Travel",@"Food",@"Shopping",@"Movie",@"Fitness",@"Others"];
    NSArray *data1 = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun"];
    NSArray *data2 = @[@36.2,@19.6,@9, @4.8, @3.6, @2.4, @2.4,@1.8,@0.9,@19.6];
   _searchCategoriesPercentUsageArray = @[@"36.2",@"19.6",@"9", @"4.8", @"3.6", @"2.4", @"2.4",@"1.8",@"0.9",@"19.6"];
    _searchCategoriesColoursArray =@[[UIColor colorWithRed:79.0/255.f green:122/255.f blue:166/255.f alpha:1.f],
                                    [UIColor colorWithRed:240/255.f green:142/255.f blue:57/255.f alpha:1.f],
                                    [UIColor colorWithRed:223/255.f green:88/255.f blue:100/255.f alpha:1.f],
                                    [UIColor colorWithRed:120/255.f green:183/255.f blue:178/255.f alpha:1.f],
                                    [UIColor colorWithRed:155/255.f green:117/255.f blue:97/255.f alpha:1.f],
                                    [UIColor colorWithRed:253/255.f green:158/255.f blue:169/255.f alpha:1.f],
                                    [UIColor colorWithRed:175/255.f green:123/255.f blue:161/255.f alpha:1.f],
                                    [UIColor colorWithRed:236/255.f green:200/255.f blue:84/255.f alpha:1.f],
                                    [UIColor colorWithRed:91/255.f green:160/255.f blue:82/255.f alpha:1.f],[UIColor colorWithRed:203/255.f green:203/255.f blue:203/255.f alpha:1.f]
                                     ],
    
    [self drawSentimentBar:data1 second:data2];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _searchCategoriesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   static NSString *scellIdentifier = @"SentimentAnalysisCellIdentifier";
    SentimentAnalysisTableViewCell *sentimentAnalysisCell = (SentimentAnalysisTableViewCell *)[tableView dequeueReusableCellWithIdentifier:scellIdentifier];
    if(sentimentAnalysisCell == nil){
    
        sentimentAnalysisCell = [[SentimentAnalysisTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:scellIdentifier];
    }
    sentimentAnalysisCell.searchCategoryLabel.text = [_searchCategoriesArray objectAtIndex:indexPath.row];
    sentimentAnalysisCell.searchCategoryImage.backgroundColor = [_searchCategoriesColoursArray objectAtIndex:indexPath.row];
    sentimentAnalysisCell.searchCategoryPercentage.text = [_searchCategoriesPercentUsageArray objectAtIndex:indexPath.row];
    
    return sentimentAnalysisCell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) drawSentimentBar:(NSArray *)dataPoints second:(NSArray *)values {
    
    NSMutableArray *yValues = [NSMutableArray array];
    [yValues addObject:[[BarChartDataEntry alloc] initWithX:0 yValues:values]];
    
    BarChartDataSet *set = nil;
    if (_sentimentBar.data.dataSetCount > 0)
    {
        set = (BarChartDataSet *)_sentimentBar.data.dataSets[0];
        set.values = yValues;
        [_sentimentBar.data notifyDataChanged];
        [_sentimentBar notifyDataSetChanged];
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
        
        _sentimentBar.data = data;
        
        _sentimentBar.leftAxis.drawLabelsEnabled = false;
        _sentimentBar.leftAxis.drawGridLinesEnabled=false;
        _sentimentBar.rightAxis.drawLabelsEnabled = false;
        _sentimentBar.rightAxis.drawGridLinesEnabled=false;
        
        _sentimentBar.xAxis.drawGridLinesEnabled=false;
        _sentimentBar.xAxis.drawLabelsEnabled=false;
        
        _sentimentBar.legend.enabled = false;
        _sentimentBar.xAxis.enabled=false;
        _sentimentBar.leftAxis.enabled=false;
        _sentimentBar.rightAxis.enabled=false;
        
        _sentimentBar.userInteractionEnabled = false;
        _sentimentBar.descriptionText = @"";
    }
    
}

- (IBAction)backToAnalyticsScreenButton:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
