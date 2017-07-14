//
//  ParentalInsightsViewController.m
//  Vayuyan
//
//  Created by sujith on 4/6/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "ParentalInsightsViewController.h"
#import "ParentalInsightsTableViewCell.h"
#import "DZNSegmentedControl.h"


@interface ParentalInsightsViewController ()<UITableViewDelegate,UITableViewDataSource,DZNSegmentedControlDelegate>
@property NSArray *websitesArray;
@property NSArray *usersArray;
@property NSArray *devicesArray;
@property NSArray *timeArray;
@property NSArray *dateArray;

@property(nonatomic,strong) DZNSegmentedControl *parentalInsightsSegmentBar;
@property NSArray *segmentBarTitleItems;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ParentalInsightsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _websitesArray = @[@"Website_one.com",@"Website_two.com",@"Website_three.com",@"Website_four.com",@"Website_five.com"];
    _usersArray =@[@"John",@"Tom",@"Mike",@"Rose",@"Jane"];
    _devicesArray = @[@"MacBook_Pro",@"IPhone",@"IPad",@"MacBook_Air",@"Iphone"];
    _timeArray   =@[@"3:50 PM",@"4:50 PM",@"5:50 PM",@"6:50 PM",@"7:50 PM",];
    _dateArray  = @[@"21 Dec",@"22 Dec",@"23 Dec",@"24 Dec",@"25 Dec"];
    _segmentBarTitleItems = @[@"Blocked Websites",@"Sensitive Searches"];
    _parentalInsightsSegmentBar = [[DZNSegmentedControl alloc] initWithItems:_segmentBarTitleItems];
    _parentalInsightsSegmentBar.showsCount = YES;
    _parentalInsightsSegmentBar.tintColor = [UIColor colorWithRed:0 green:176/255.0 blue:185/255.0 alpha:1];
    _parentalInsightsSegmentBar.showsGroupingSeparators = YES;
    _parentalInsightsSegmentBar.autoAdjustSelectionIndicatorWidth = YES;
   // _parentalInsightsSegmentBar.layer.frame = CGRectMake(0,95, //self.tableView.tableHeaderView.frame.size.width, 10);
    _parentalInsightsSegmentBar.height = 60;
     _parentalInsightsSegmentBar.layer.frame = CGRectMake(0, 65
, self.view.frame.size.width/2, self.tableView.tableHeaderView.frame.size.height);
    
    [_parentalInsightsSegmentBar addTarget:self action:@selector(didChangeInsightsSegment:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:_parentalInsightsSegmentBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _websitesArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellID = @"ParentalInsightsCellIdentifier";
    
    ParentalInsightsTableViewCell *insightsCell = (ParentalInsightsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    if(insightsCell == nil){
        insightsCell = [[ParentalInsightsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
   insightsCell.websiteLabel.text= [_websitesArray objectAtIndex:indexPath.row];
    insightsCell.userLabel.text    = [_usersArray objectAtIndex:indexPath.row];
    insightsCell.deviceLabel.text  = [_devicesArray objectAtIndex:indexPath.row];
    insightsCell.DateLabel.text    =[_dateArray objectAtIndex:indexPath.row];
    insightsCell.timeLabel.text     =[_timeArray objectAtIndex:indexPath.row];
    [_parentalInsightsSegmentBar setCount:@5 forSegmentAtIndex:0];
    [_parentalInsightsSegmentBar setCount:@6 forSegmentAtIndex:1];
    return insightsCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
}


-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
    
    UILabel *websiteHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.frame.size.width, 25)];
    UILabel *userHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-170, 3, tableView.frame.size.width, 25)];
    UILabel *deviceHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-115, 3, tableView.frame.size.width, 25)];
    UILabel *timeHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-40, 3, tableView.frame.size.width, 25)];
    websiteHeaderLabel.text = @"Website";
    userHeaderLabel.text =@"User";
    deviceHeaderLabel.text = @"Device";
    timeHeaderLabel.text  =@"Time";
    
   websiteHeaderLabel.font =[UIFont fontWithName:@"ProximaNova-Semibold" size:10.0f];
   userHeaderLabel.font =[UIFont fontWithName:@"ProximaNova-Semibold" size:10.0f];
   deviceHeaderLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:10.0f];
   timeHeaderLabel.font = [UIFont fontWithName:@"ProximaNova-Semibold" size:10.0f];
    
    websiteHeaderLabel.textColor = [UIColor colorWithRed:152.0/255.0 green:156.0/255.0 blue:158.0/255.0 alpha:1];
    userHeaderLabel.textColor = [UIColor colorWithRed:152.0/255.0 green:156.0/255.0 blue:158.0/255.0 alpha:1];
    deviceHeaderLabel.textColor = [UIColor colorWithRed:152.0/255.0 green:156.0/255.0 blue:158.0/255.0 alpha:1];
    timeHeaderLabel.textColor = [UIColor colorWithRed:152.0/255.0 green:156.0/255.0 blue:158.0/255.0 alpha:1];
    

    

    [header addSubview:websiteHeaderLabel];
    [header addSubview:userHeaderLabel];
    [header addSubview:deviceHeaderLabel];
    [header addSubview:timeHeaderLabel];

}


/*-(DZNSegmentedControl *) parentalInsightsSegmentBar{

    if (!_parentalInsightsSegmentBar)
    {
        _parentalInsightsSegmentBar = [[DZNSegmentedControl alloc] initWithItems:_segmentBarTitleItems];
        _parentalInsightsSegmentBar.delegate = self;
        _parentalInsightsSegmentBar.selectedSegmentIndex = 0;
        _parentalInsightsSegmentBar.bouncySelectionIndicator = NO;
         _parentalInsightsSegmentBar.layer.frame = CGRectMake(0, 30, self.view.frame.size.width/2, 60);
        _parentalInsightsSegmentBar.height = 60.0f;
        _parentalInsightsSegmentBar.showsCount=YES;
        //                _control.height = 120.0f;
        //                _control.width = 300.0f;
        _parentalInsightsSegmentBar.showsGroupingSeparators = YES;
        //                _control.inverseTitles = YES;
        //_control.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:249/255.0 alpha:1];
        _parentalInsightsSegmentBar.tintColor = [UIColor colorWithRed:0 green:176/255.0 blue:185/255.0 alpha:1];
        //                _control.hairlineColor = [UIColor purpleColor];
        //                _control.showsCount = NO;
        _parentalInsightsSegmentBar.autoAdjustSelectionIndicatorWidth = YES;
        //                _control.selectionIndicatorHeight = 4.0;
        //                _control.adjustsFontSizeToFitWidth = YES;
        
        [_parentalInsightsSegmentBar addTarget:self action:@selector(didChangeInsightsSegment:) forControlEvents:UIControlEventValueChanged];
    }
    //[self updateControlCounts];
    return _parentalInsightsSegmentBar;

}
*/
-(void)didChangeInsightsSegment:(DZNSegmentedControl *)parentalInsightsBar{
    
    
 
}
- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionAny;
}

- (UIBarPosition)positionForSelectionIndicator:(id<UIBarPositioning>)bar
{
    return UIBarPositionAny;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)handleBackButton:(id)sender {

    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
