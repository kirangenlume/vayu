//
//  GroupedDevicesDetailViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/11/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "GroupedDevicesDetailViewController.h"

@interface GroupedDevicesDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation GroupedDevicesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    
    identifier = @"AllDevicesCell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 2)];
    headerView.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
    
    return headerView;
}

- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
