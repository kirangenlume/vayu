//
//  AdvancedSettingsViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/4/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "AdvancedSettingsViewController.h"
#import "ChangeAdvancedSettingsViewController.h"
#import "ProfileDetailViewController.h"
#import "LeftImageTextField-Swift.h"

@interface AdvancedSettingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray *advSettingsArray;
@property (nonatomic) NSArray *profilesArray;
@property (nonatomic) NSArray *titleArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) BOOL didClickAddButton;
@end

@implementation AdvancedSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView.tableFooterView = [UIView new];

    _titleArray = @[@"",@"WiFi Settings",@"Advanced Settings",@"",@"",@"Profiles",@""];
    _advSettingsArray = @[@"DNS", @"WAN", @"DHCP IP Reservations", @"Port Forwarding", @"UPnP", @"Network Mode"];
    _profilesArray = @[@"Adult", @"Entertainment", @"Rachel"];
    
    _titleLabel.text = [_titleArray objectAtIndex:_selectedIndex];
    
    if (_selectedIndex != 5) {
        _addProfileButton.hidden = YES;
    }
    _didClickAddButton = false;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (_selectedIndex) {
            case 1:
                return 1;
            case 2:
                return 6;
            case 5:
                return 3;
            break;
    }

    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    
    switch (_selectedIndex){
    
            
    case 1:{
        identifier = @"WiFiSettingsCellIdentifier";
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];

        LeftImageTextField *networkName = (LeftImageTextField *)[cell viewWithTag:5105];
        networkName.layer.masksToBounds = NO;
        networkName.layer.shadowRadius = 3.0;
        networkName.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        networkName.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        networkName.layer.shadowOpacity = 1.0;
        networkName.layer.cornerRadius = 3.0;
        networkName.placeholder = @"    Vimana";
        
        LeftImageTextField *password = (LeftImageTextField *)[cell viewWithTag:5106];
        password.placeholder = @"   Test123";
        password.layer.masksToBounds = NO;
        password.layer.shadowRadius = 3.0;
        password.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
        password.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        password.layer.shadowOpacity = 1.0;
        password.layer.cornerRadius = 3.0;
        
        UIButton *saveButton = (UIButton *)[cell viewWithTag:5107];
        [saveButton addTarget:self action:@selector(saveNetworkNameAndPasswordOnClick:) forControlEvents:UIControlEventTouchUpInside];
        
            return cell;
    }
    case 2:{
    
        NSLog(@"entered case 2");
        if (indexPath.row == 4) {
            NSLog(@"entered indexpath.row 4");
        identifier = @"AdvancedSettingsCellWithSwitchIdentifier";
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        UISwitch *toggle = (UISwitch *)[cell viewWithTag:5101];
        
        UILabel *settingLabel = (UILabel *)[cell viewWithTag:5100];
        settingLabel.text = [_advSettingsArray objectAtIndex:indexPath.row];
        
        
        return cell;
        } else {
        NSLog(@"entered indexpath.row !4");
        identifier = @"AdvancedSettingsCellIdentifier";
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        UILabel *settingLabel = (UILabel *)[cell viewWithTag:5102];
        settingLabel.text = [_advSettingsArray objectAtIndex:indexPath.row];
        
        return cell;
        }
    }
    case 5:
        {
            NSLog(@"entered case 5");
            identifier = @"AdvancedSettingsCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            UILabel *settingLabel = (UILabel *)[cell viewWithTag:5102];
            settingLabel.text = [_profilesArray objectAtIndex:indexPath.row];
            
            return cell;
        }
            break;
            
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectedIndex == 1) {
        return self.view.frame.size.height;
    }
    return 65;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (_selectedIndex) {
            case 2:
            if (indexPath.row !=4 && indexPath.row !=3)
            [self performSegueWithIdentifier:@"ChangeAdvancedSettingsSegue" sender:self];
            break;
            case 5:
            [self performSegueWithIdentifier:@"ProfileDetailViewSegue" sender:self];
        default:
            break;
    }
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ChangeAdvancedSettingsSegue"]){
    ChangeAdvancedSettingsViewController *casvc = segue.destinationViewController;
    casvc.selectedIndex = _tableView.indexPathForSelectedRow.row;
    }
    
    if ([segue.identifier isEqualToString:@"ProfileDetailViewSegue"]) {
        ProfileDetailViewController *pdvc = segue.destinationViewController;
        pdvc.profileNameData = [_profilesArray objectAtIndex:_tableView.indexPathForSelectedRow.row];
        if (_didClickAddButton) {
            pdvc.profileNameData= @"New Profile";
        }
        NSLog(@"indexPath for selected row: %ld",_tableView.indexPathForSelectedRow.row);
    }
}

-(IBAction)saveNetworkNameAndPasswordOnClick:(id)sender{
    NSLog(@"Clicked Save Button");
}

-(IBAction)addNewProfile:(id)sender{
    _didClickAddButton = true;
    [self performSegueWithIdentifier:@"ProfileDetailViewSegue" sender:self];
}

- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}
@end
