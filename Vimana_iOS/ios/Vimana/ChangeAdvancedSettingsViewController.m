//
//  ChangeAdvancedSettingsViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/4/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "ChangeAdvancedSettingsViewController.h"
#import "LeftImageTextField-Swift.h"
@import QuartzCore;

@interface ChangeAdvancedSettingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSArray *titlesArray;
@property (nonatomic) NSArray *networkModeArray;
@property (nonatomic) NSArray *dhcpReservationListArray;
@property (nonatomic) NSArray *dhcpReservationIPArray;
@property (nonatomic) NSArray *wanArray;
@property (nonatomic) NSArray *dnsArray;

@property (nonatomic) NSInteger selectedDNSIndex;
@property (nonatomic) NSInteger selectedWANIndex;
@property (nonatomic) NSInteger selectedNetworkModeIndex;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ChangeAdvancedSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.tableView.tableFooterView = [UIView new];

    _titlesArray = @[@"DNS",@"WAN",@"DHCP Reservations",@"",@"", @"Network Mode"];
    _titleLabel.text = [_titlesArray objectAtIndex:_selectedIndex];
    
    if (_selectedIndex != 2) {
        _addButton.hidden = YES;
    }
    
    _networkModeArray = @[@"NAT", @"Bridge Mode"];
    _dnsArray = @[@"Automatic", @"Google", @"Custom"];
    _wanArray = @[@"", @"DHCP", @"Static", @"PPPoE"];
    _dhcpReservationListArray = @[@"Printer"];
    _dhcpReservationIPArray = @[@"192.168.0.5"];
    
    _selectedDNSIndex = -1;
    _selectedWANIndex = -1;
    _selectedNetworkModeIndex = -1;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (_selectedIndex) {
            case 0:
            return 3;
            break;
            
            case 1:
            return 4;
            
            case 2:
            return 1;
            
            case 5:
            return 2;
        default:
            break;
    }
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    
    switch (_selectedIndex) {
            
            case 0:
        {
            identifier = @"AdvancedSettingsCellWithSelectionImageIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            UIImageView *selectedOptionImage = (UIImageView *)[cell viewWithTag:5200];
            selectedOptionImage.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            selectedOptionImage.layer.borderWidth = 1;
            if (indexPath.row == _selectedDNSIndex)
                selectedOptionImage.backgroundColor = [UIColor colorWithRed:126/255.0 green:211/255.0 blue:33/255.0 alpha:1];
            else
                selectedOptionImage.backgroundColor = [UIColor clearColor];
            
            UILabel *optionLabel = (UILabel *)[cell viewWithTag:5201];
            optionLabel.text = [_dnsArray objectAtIndex:indexPath.row];
            
            return  cell;
            
            break;
        }
            case 1:
        {
            if (indexPath.row == 0) {
                identifier = @"AdvancedSettingsWANCellIdentifier";
                cell = [tableView dequeueReusableCellWithIdentifier:identifier];
                
                LeftImageTextField *wanIP = (LeftImageTextField *)[cell viewWithTag:5204];
                wanIP.layer.masksToBounds = NO;
                wanIP.layer.shadowRadius = 3.0;
                wanIP.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
                wanIP.layer.shadowOffset = CGSizeMake(1.0, 1.0);
                wanIP.layer.shadowOpacity = 1.0;
                wanIP.layer.cornerRadius = 3.0;
                
                wanIP.placeholder = @"10.0.0.6";
                
                return cell;
            }
            
            identifier = @"AdvancedSettingsCellWithSelectionImageIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            UIImageView *selectedOptionImage = (UIImageView *)[cell viewWithTag:5200];
            selectedOptionImage.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            selectedOptionImage.layer.borderWidth = 1;
            if (indexPath.row == _selectedWANIndex)
                selectedOptionImage.backgroundColor = [UIColor colorWithRed:126/255.0 green:211/255.0 blue:33/255.0 alpha:1];
            else
                selectedOptionImage.backgroundColor = [UIColor clearColor];
            
            UILabel *optionLabel = (UILabel *)[cell viewWithTag:5201];
            optionLabel.text = [_wanArray objectAtIndex:indexPath.row];
            
            return  cell;
            
            break;
        }
            case 2:
        {
            identifier = @"AdvancedSettingsDHCPCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            
            UILabel *dhcpListLabel = (UILabel *)[cell viewWithTag:5202];
            dhcpListLabel.text = [_dhcpReservationListArray objectAtIndex:indexPath.row];
            
            UILabel *dhcpIPLabel = (UILabel *)[cell viewWithTag:5203];
            dhcpIPLabel.text = [_dhcpReservationIPArray objectAtIndex:indexPath.row];
            
            
            return  cell;
            
            
            break;
        }
            case 5:
        {
            identifier = @"AdvancedSettingsCellWithSelectionImageIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            UIImageView *selectedOptionImage = (UIImageView *)[cell viewWithTag:5200];
            selectedOptionImage.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            selectedOptionImage.layer.borderWidth = 1;
            if (indexPath.row == _selectedNetworkModeIndex)
                selectedOptionImage.backgroundColor = [UIColor colorWithRed:126/255.0 green:211/255.0 blue:33/255.0 alpha:1];
            else
                selectedOptionImage.backgroundColor = [UIColor clearColor];
            
            UILabel *optionLabel = (UILabel *)[cell viewWithTag:5201];
            optionLabel.text = [_networkModeArray objectAtIndex:indexPath.row];
            
            return  cell;
            
            break;
        }
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_selectedIndex == 1 && indexPath.row == 0) {
        return 130;
    }
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (_selectedIndex) {
        case 0:
            _selectedDNSIndex = indexPath.row;
            break;
        case 1:
            if (indexPath.row != 0)
                _selectedWANIndex = indexPath.row;
        case 5:
            _selectedNetworkModeIndex = indexPath.row;
    }
        [tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"NewDHCPReservationSegue"]) {
        
    }
    
}


- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
