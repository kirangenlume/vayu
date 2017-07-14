//
//  SettingsViewController.m
//  Vayuyan
//
//  Created by suryateja on 3/28/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import "ToggleWiFiTableViewCell.h"
#import "AdvancedSettingsViewController.h"

@interface SettingsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) NSArray *settingsArray;
@property (nonatomic) NSArray *imagesArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor colorWithRed:88/255.0 green:90/255.0 blue:89/255.0 alpha:1],
       NSFontAttributeName:[UIFont fontWithName:@"AktivGrotesk-Regular" size:14]}];
    
    
    _settingsArray = @[@"Pause WiFi",@"WiFi Settings",@"Advanced Settings",@"Privacy",@"Notifications",@"Profiles",@"Users"];
    _imagesArray = @[@"Pause WiFi", @"WiFiSettings", @"Advanced Settings", @"Privacy", @"Notifications", @"Profiles", @"Users"];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
        case 1:
            return 4;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier;
    
    if (indexPath.section==0 && indexPath.row ==0) {
        cellIdentifier = @"ToggleWiFiCell";
        ToggleWiFiTableViewCell *cell1 = (ToggleWiFiTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell1.toggleWiFiImage.image = [UIImage imageNamed:[_imagesArray objectAtIndex:0]];
        cell1.toggleWiFiLabel.text = @"Pause WiFi";
        return cell1;
        
    }
    
    cellIdentifier = @"SettingsCell";
    SettingsTableViewCell *cell = (SettingsTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.settingsImage.image = [UIImage imageNamed:[_imagesArray objectAtIndex:indexPath.section*2 + indexPath.row + indexPath.section%2 ]];
    cell.settingsLabel.text = [_settingsArray objectAtIndex:indexPath.section*2 + indexPath.row + indexPath.section%2 ];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 1:
            return 29;
            break;
    }
    
    return 0;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section ==1) {
        UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,tableView.frame.size.width,29)];
        labelHeader.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
        labelHeader.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
        labelHeader.textAlignment = NSTextAlignmentCenter;
        labelHeader.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
        labelHeader.text = @"More";
        
        return labelHeader;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section*2 + indexPath.row + indexPath.section%2) {
        case 1:
        case 2:
        case 5:
            [self performSegueWithIdentifier:@"AdvancedSettingsSegue" sender:self];
            break;

    }
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"AdvancedSettingsSegue"]) {
        AdvancedSettingsViewController *asvc=segue.destinationViewController;
        NSLog(@"String: %@", [_settingsArray objectAtIndex:_tableView.indexPathForSelectedRow.row]);
        asvc.titleLabel.text = [_settingsArray objectAtIndex:(_tableView.indexPathForSelectedRow.section*2 + _tableView.indexPathForSelectedRow.row + _tableView.indexPathForSelectedRow.section%2)];
        asvc.selectedIndex = _tableView.indexPathForSelectedRow.section*2 + _tableView.indexPathForSelectedRow.row + _tableView.indexPathForSelectedRow.section%2;
    }
}


@end
