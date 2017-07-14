//
//  UserSentimentViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/7/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "UserSentimentViewController.h"

@interface UserSentimentViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation UserSentimentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
        case 2:
            return 1;
            break;
        case 1:
        case 3:
            return 5;
        default:
            break;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
        case 2:
            identifier = @"UserSentimentCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            return cell;
            break;
        case 1:
        case 3:
            identifier = @"WebsitesVisitedCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            return cell;
            break;
            
        
    }
    
    return cell;

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        case 2:
            return 70;
            break;
        case 1:
        case 3:
            return 30;
        default:
            break;
    }
    return 1;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section%2 == 0) {
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        [headerView setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,tableView.frame.size.width,30)];
        labelHeader.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        labelHeader.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];

        
        [headerView addSubview:labelHeader];
            labelHeader.textAlignment = NSTextAlignmentLeft;
        
        if (section == 0) {
            labelHeader.text = @"  Primary Sentiment";
        }
        if (section == 2) {
            labelHeader.text = @"  Secondary Sentiment";
        }
        return headerView;
    }
    if (section%2 == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,30)];
        [view setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *reportsLabel = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width/2 , 30)];
        reportsLabel.textAlignment = NSTextAlignmentLeft;
        reportsLabel.text = @"  Websites Visited";
        reportsLabel.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        reportsLabel.font =[UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        [view addSubview:reportsLabel];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(tableView.bounds.size.width/2, 0, tableView.bounds.size.width/2-10, 30)];
        label.textAlignment = NSTextAlignmentRight;
        label.text = @"Device";
        label.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        label.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        [view addSubview:label];
        return view;
    }
    return  nil;
}
- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
