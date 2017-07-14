//
//  NotificationViewController.m
//  Vayuyan
//
//  Created by suryateja on 3/24/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "NotificationsViewController.h"
#import "DashboardViewController.h"
#import "NotificaionServices.h"
@interface NotificationsViewController () <UITableViewDelegate, UITableViewDataSource, ResponseSProtocol>

@property (nonatomic) NSArray *notificationData;
@property (nonatomic) NSArray *allKeys;
@property (nonatomic) NSEnumerator *notificationDataEnumerator;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void)modifyDataToRequiredFormat:(NSArray *)data;

@end

@implementation NotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _swiper.direction = UISwipeGestureRecognizerDirectionRight;
    
    NotificaionServices *notificationService = [[NotificaionServices alloc] init];
    notificationService.delegate = self;
    [notificationService getNotifationswithPayload:@"vimana1"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  _notificationData.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"NotificationCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    UILabel *messageLabel = [cell viewWithTag:1100];
    UILabel *timeLabel = [cell viewWithTag:1101];
    
    NSDictionary *temp = [_notificationData objectAtIndex:indexPath.row];

    messageLabel.text = [temp objectForKey:[_allKeys objectAtIndex:1]];
    timeLabel.text = [temp objectForKey:[_allKeys objectAtIndex:2]];

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 29)];
    [headerView setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (10,0,tableView.frame.size.width-10,30)];
    labelHeader.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:11.0f];
    labelHeader.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
    labelHeader.textAlignment = NSTextAlignmentLeft;
    if (section == 0) {
    labelHeader.text = @" Today";
    }
    else
        labelHeader.text = @" Yesterday";
    [headerView addSubview:labelHeader];
    
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(self.view.frame.size.width-60, 10, 50, 13);
    addButton.layer.cornerRadius = 6.5;
    addButton.titleLabel.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:10.0f];
    [addButton setTitle:@"Clear All" forState:UIControlStateNormal];
    addButton.contentHorizontalAlignment = NSTextAlignmentLeft;
    addButton.backgroundColor = [UIColor colorWithRed:208/255.0 green:2/255.0 blue:27/255.0 alpha:1];
    [headerView addSubview:addButton];
    
    
    
    return headerView;
    
}

-(IBAction)dismissAction:(id)sender{
    
        [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) modifyDataToRequiredFormat:(NSArray *) data{
    _allKeys = [[data objectAtIndex:0] allKeys];
    NSLog(@"%@", _allKeys);
}

- (IBAction)onSwipe:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)responseData:(id)response {
    NSLog(@"Notification Service Response%@",response);
    _notificationData = (NSArray *)response;
    [self modifyDataToRequiredFormat:_notificationData];
    [_tableView reloadData];

}
@end
