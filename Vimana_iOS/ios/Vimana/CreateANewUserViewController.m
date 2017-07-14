//
//  CreateANewUserViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/7/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "CreateANewUserViewController.h"

@interface CreateANewUserViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray *profilesArray;

@end

@implementation CreateANewUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _profilesArray = @[@"Adult",@"Entertainment",@"Rachel", @"+  New Profile"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
            identifier = @"CreateANewUserNameCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            return cell;
            
            break;
        case 1:
            identifier = @"AssignDevicesCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            return cell;
            
            break;
        case 2:
            identifier = @"ProfileCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            UILabel *profileLabel = (UILabel *)[cell viewWithTag:4401];
            profileLabel.text = [_profilesArray objectAtIndex:indexPath.row];
            
            return cell;
            break;
    }
    
    return cell;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 29)];
        [headerView setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,tableView.frame.size.width,30)];
        labelHeader.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        labelHeader.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
        
        [headerView addSubview:labelHeader];
        
            labelHeader.textAlignment = NSTextAlignmentLeft;
            labelHeader.text = @"  Assign Devices";
  
            UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
            addButton.frame = CGRectMake(self.view.frame.size.width-33, 0, 30, 25);
            [addButton setImage:[UIImage imageNamed:@"ButtonImage"] forState:UIControlStateNormal];
            //addButton.backgroundColor = [UIColor blueColor];
            [headerView addSubview:addButton];

        
        
        return headerView;
    }
    if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,30)];
        [view setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *reportsLabel = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width/2 , 30)];
        reportsLabel.textAlignment = NSTextAlignmentLeft;
        reportsLabel.text = @"  Assign a Profile";
        reportsLabel.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        reportsLabel.font =[UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        [view addSubview:reportsLabel];
        
        return view;
    }
    return  nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    if (section == 0) {
        
        return 0;
    }
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return 60;
        case 1:
            return 75;
        case 2:
            return 45;
    }
    return 0;
}


- (IBAction)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
