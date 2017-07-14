//
//  UserInfoViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController () <UITableViewDataSource, UITableViewDelegate>
    @property (nonatomic) BOOL editFlagStatus;
@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _editFlagStatus = false;
    
    [_deviceImage layoutIfNeeded];
    _deviceImage.layer.cornerRadius=_deviceImage.frame.size.width/2;
    _deviceImage.clipsToBounds = YES;

    NSLog(@"Selected User: %ld", _selectedUser);
    _deviceImage.image = [UIImage imageNamed:[@"User" stringByAppendingFormat:@"%ld",_selectedUser+1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:{
            
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"Device User Profile and Priority"];
            
            UIImageView *userDetailImage = (UIImageView *)[cell viewWithTag:110];
            UILabel *userDetail = (UILabel *) [cell viewWithTag:120];
            UILabel *userDetailData = (UILabel *) [cell viewWithTag:130];
            

                userDetailImage.image =[UIImage imageNamed:@"Profiles"];
                userDetail.text = @"Profile";
                
                //userDetailData.text = [_deviceData objectForKey:@"profile_type"];
            
            break;
        }
            
        case 1:{
            cell = [tableView dequeueReusableCellWithIdentifier:@"UserSentimentCellIdentifier"];
            
            return cell;
            break;
        }
        case 2:
        {
                cell = [tableView dequeueReusableCellWithIdentifier:@"DevicesListCellOfAUser"];
                

            
            break;
        }
        case 3:
            if (indexPath.row==0) {
                cell = [tableView dequeueReusableCellWithIdentifier:@"DataUsageReports"];
            }
            if (indexPath.row==1) {
                cell = [tableView dequeueReusableCellWithIdentifier:@"ParentalInsightsReports"];
            }
            break;
        default:
        if (_editFlagStatus == true) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"Delete User"];
                
        }
    }
    return cell;
    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  if (_editFlagStatus == true) {
        return 5;
   }
    return 4;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 1:
            return @"Summary";
        case 2:
            return @"Reports";
        default:
            return @"";
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return 40;
        case 1:
        case 2:
            return 75;
        case 3:
            return 90;
        default:
            return 40;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        
        return 0;
    }
    
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 1;
        case 1:
        case 2:
            return 1;
        case 3:
            return 2;
        default:
            return 1;
            break;
    }
    
    return 0;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,30)];
        [view setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *reportsLabel = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width/2 , 30)];
        reportsLabel.textAlignment = NSTextAlignmentLeft;
        reportsLabel.text = @"  General Sentiment";
        reportsLabel.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        reportsLabel.font =[UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        [view addSubview:reportsLabel];
        return view;
    }
    
    if (section == 2) {
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 29)];
        [headerView setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,tableView.frame.size.width,30)];
        labelHeader.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        labelHeader.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
        labelHeader.textAlignment = NSTextAlignmentCenter;
        labelHeader.text = @"Devices";
        
        
        [headerView addSubview:labelHeader];
        
            UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
            addButton.frame = CGRectMake(self.view.frame.size.width-33, 0, 30, 25);
            [addButton setImage:[UIImage imageNamed:@"ButtonImage"] forState:UIControlStateNormal];
            //addButton.backgroundColor = [UIColor blueColor];
            [headerView addSubview:addButton];
            

        
        
        return headerView;
    }
    if (section == 3) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,30)];
        [view setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *reportsLabel = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width/2 , 30)];
        reportsLabel.textAlignment = NSTextAlignmentLeft;
        reportsLabel.text = @"  Reports";
        reportsLabel.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        reportsLabel.font =[UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        [view addSubview:reportsLabel];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(tableView.bounds.size.width/2, 0, tableView.bounds.size.width/2-10, 30)];
        label.textAlignment = NSTextAlignmentRight;
        label.text = @"Last 7 days  ";
        label.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        label.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        [view addSubview:label];
        return view;
    }
    return  nil;
}


- (IBAction)editUserOrDevice:(id)sender {
    
    _editFlagStatus =!_editFlagStatus;
    if (_editFlagStatus) {
        [_editButton setTitle:@"Done" forState:UIControlStateNormal];
    }else
        [_editButton setTitle:@"Edit" forState:UIControlStateNormal];
    
    
    [_tableView reloadData];
    
}

- (IBAction)deleteUser:(id)sender {
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"deleteUserFromArray"
     object:nil ];
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
