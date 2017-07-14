//
//  AddDeviceToGroupViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/11/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "AddDeviceToGroupViewController.h"

@interface AddDeviceToGroupViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation AddDeviceToGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    
    identifier = @"AllDevicesCell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
    
    UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake((headerView.frame.size.width/2)- 100, 5, 205, 20)];
    headerLbl.text = @"All Devices";
    headerLbl.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
    headerLbl.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:14.0f];
    headerLbl.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:headerLbl];
    headerView.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f];

    return headerView;
}

- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
