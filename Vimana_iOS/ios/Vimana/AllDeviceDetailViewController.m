//
//  AllDeviceDetailViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/11/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "AllDeviceDetailViewController.h"

@interface AllDeviceDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AllDeviceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width,1)];
    [view setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
    UILabel *reportsLabel = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, _tableView.bounds.size.width/2 , 30)];
    reportsLabel.textAlignment = NSTextAlignmentLeft;
    reportsLabel.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
    reportsLabel.font =[UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
    [view addSubview:reportsLabel];
    reportsLabel.text = @"  Automation";
    _tableView.tableHeaderView = view;*/
     
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    
    identifier =@"AllDevicesDetailCellIdentiifer";
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 1:
            return @"Automation";
            break;
        case 2:
            return @"Scenes";
    }
    return nil;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    

    
    if (section == 0) {
        
        return nil;
    }
    
    if (section == 1) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,30)];
        [view setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *reportsLabel = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width/2 , 30)];
        reportsLabel.textAlignment = NSTextAlignmentLeft;
        reportsLabel.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        reportsLabel.font =[UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        [view addSubview:reportsLabel];
        reportsLabel.text = @"  Automation";
        return view;
    }
    
    if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,30)];
        [view setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
        UILabel *reportsLabel = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width/2 , 30)];
        reportsLabel.textAlignment = NSTextAlignmentLeft;
        reportsLabel.textColor = [UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1];
        reportsLabel.font =[UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        [view addSubview:reportsLabel];
        reportsLabel.text = @"  Scenes";
        return view;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1f;
    }
    return 30;
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
