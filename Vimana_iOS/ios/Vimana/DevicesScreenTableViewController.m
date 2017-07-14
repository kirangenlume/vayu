//
//  DevicesScreenTableViewController.m
//  Vayuyan
//
//  Created by kirang on 3/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//


#import "DevicesScreenTableViewController.h"
#import "DevicesScreenTableViewCell.h"
#import "DZNSegmentedControl.h"
#import "DevicesMappingTableViewCell.h"
#import "DeviceListModal.h"
#import "Constants.h"
#import "VimanaView.h"
#import "DeviceInfoTableViewController.h"
#import "UserInfoViewController.h"

#define DEVICES_MAP_HEIGHT 280

@interface DevicesScreenTableViewController ()<DZNSegmentedControlDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) NSDictionary *temp1;

@property (weak, nonatomic) IBOutlet UIButton *addUserButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;
@property (weak, nonatomic) IBOutlet UIView *devicesMapView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *devicesMapHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toggleButtonHeightConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)toggleDeviceMap:(id)sender;

@property (nonatomic, strong) DZNSegmentedControl *control;

@property (nonatomic, strong) DZNSegmentedControl *devicesAndUsersSegmentBar;
@property (nonatomic, strong) NSArray *devicesAndUsersSegmentItems;

@property (nonatomic) DeviceListModal *devicesData;
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSMutableArray *sourceData;
@property (nonatomic) VimanaView *ellipseView;

@property (nonatomic) NSMutableArray *userNameArray;
@property (nonatomic) NSMutableArray *userDeviceArray;
@property (nonatomic) NSMutableArray *userProfileArray;



@end

@implementation DevicesScreenTableViewController

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self plotDevices];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    //self.navigationItem.title =  @"Connected Devices";
    _devicesData = [[DeviceListModal alloc] init];
    self.tableView.tableFooterView = [UIView new];
    
    _menuItems = @[@"Total", @"Excellent",@"Good", @"Weak",@"Wired"];
    _devicesAndUsersSegmentItems = @[@"Devices", @"Users"];
    
    //_devicesAndUsersTabView=self.devicesAndUsersSegmentBar;
    [self.view addSubview:self.devicesAndUsersSegmentBar];
    
   NSURL *url = [NSURL URLWithString:@"https://luk0r3ls53.execute-api.us-west-1.amazonaws.com/VimanaQA/device/vimana1"];
    _devicesData.connectedDevicesList= [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url] options:kNilOptions error:nil];
    [_devicesData segregateDevices];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
    
    _userNameArray = [[NSMutableArray alloc] initWithObjects:@"Rachel Roe",@"Baby  Roe",@"Princess Roe",@"Jane Roe",@"Johnny Roe" ,nil ];
    _userDeviceArray = [[NSMutableArray alloc] initWithObjects:@"2",@"3",@"6",@"2", nil ];
    _userProfileArray =[[NSMutableArray alloc] initWithObjects:@"Rachel",@"G",@"PG",@"Adult", nil ];
    
    _addUserButton.hidden = YES;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(deleteUserFromArray)
     name:@"deleteUserFromArray"
     object:nil ];
    
}

-(void) deleteUserFromArray{
    [_userNameArray removeObjectAtIndex:_indexToDelete];
    [_userProfileArray removeObjectAtIndex:_indexToDelete];
    [_userDeviceArray removeObjectAtIndex:_indexToDelete];
    [self.tableView reloadData];
}

-(void) plotDevices{
    _ellipseView = [[VimanaView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width,250)];
    [_devicesMapView addSubview:_ellipseView];
    for (int index=0; index<_devicesData.connectedDevicesList.count; index++) {
        //   [_ellipseView drawDeviceWithSignalStrength:[[[_devicesData.connectedDevicesList objectAtIndex:index] objectForKey:@"signal_strength"] integerValue]];
        CGPoint coordinates;
        coordinates.x = [[[_devicesData.connectedDevicesList objectAtIndex:index] objectForKey:@"x"] floatValue];
        coordinates.y = [[[_devicesData.connectedDevicesList objectAtIndex:index] objectForKey:@"y"]floatValue];
        
        
        [_ellipseView drawDeviceWithSignalStrength:[[[_devicesData.connectedDevicesList objectAtIndex:index] objectForKey:@"signal_strength"] integerValue] andCoOrdinates:coordinates];
        NSLog(@"done %d %ld",index,[[[_devicesData.connectedDevicesList objectAtIndex:index] objectForKey:@"signal_strength"] integerValue]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
    if ([_devicesAndUsersSegmentBar selectedSegmentIndex] ==1) {
        static NSString *cellIdentifier = @"UsersListCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        
        UIImageView *userImage = (UIImageView *)[cell viewWithTag:1003];
        userImage.layer.cornerRadius=userImage.frame.size.width/2;
        userImage.clipsToBounds = YES;
        [userImage layoutIfNeeded];
        
        userImage.image = [UIImage imageNamed:[@"User" stringByAppendingFormat:@"%ld",indexPath.row+1]];
        
        UILabel *userName = (UILabel *)[cell viewWithTag:1000];
        UILabel *userProfile = (UILabel *)[cell viewWithTag:1001];
        UILabel *userDevices = (UILabel *)[cell viewWithTag:1002];
        
        userName.text = [_userNameArray objectAtIndex:indexPath.row];
        userProfile.text = [_userProfileArray objectAtIndex:indexPath.row];
        userDevices.text = [_userDeviceArray objectAtIndex:indexPath.row];
        
    }
    
    else{
        
        
        
        
        static NSString *cellIdentifier = @"DevicesListCell";
        unsigned long int temp = 0;
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        NSDictionary *dict;
        if ([_control selectedSegmentIndex] ==1 )
        {
            
            
            temp = [[_devicesData.excellentSignalStrengthDeviceIndices objectAtIndex:indexPath.row] unsignedIntegerValue];
            NSLog(@"%lu",temp);
            
            //if (temp<_devicesData.weakSignalStrengthDeviceIndices.count)
            dict = [_devicesData.connectedDevicesList objectAtIndex:temp];
        }
        
        if ([_control selectedSegmentIndex] ==3) {
            
            
            
            temp = [[_devicesData.weakSignalStrengthDeviceIndices objectAtIndex:indexPath.row] unsignedIntegerValue];
            NSLog(@"%lu",temp);
            
            
            // if (temp<_devicesData.goodSignalStrengthDeviceIndices.count)
            dict = [_devicesData.connectedDevicesList objectAtIndex:temp];
        }
        
        if ([_control selectedSegmentIndex] ==4) {
            
            
            temp = [[_devicesData.verygoodSignalStrengthDeviceIndices objectAtIndex:indexPath.row] unsignedIntegerValue];
            NSLog(@"%lu",temp);
            
            
            //if (temp<_devicesData.verygoodSignalStrengthDeviceIndices.count)
            dict = [_devicesData.connectedDevicesList objectAtIndex:temp];
        }
        if ([_control selectedSegmentIndex] ==2) {
            
            
            temp = [[_devicesData.goodSignalStrengthDeviceIndices objectAtIndex:indexPath.row] unsignedIntegerValue];
            NSLog(@"%lu",temp);
            
            
            //if (temp<_devicesData.excellentSignalStrengthDeviceIndices.count)
            dict = [_devicesData.connectedDevicesList objectAtIndex:temp];
        }
        if ([_control selectedSegmentIndex] ==0) {
            
            
            dict = [_devicesData.connectedDevicesList objectAtIndex:indexPath.row];
            temp = indexPath.row;
            NSLog(@"%lu",temp);
        }
        
        
        
        UILabel *deviceName = (UILabel *)[cell viewWithTag:100];
        UILabel *signalStrength = (UILabel *)[cell viewWithTag:200];
        UILabel *member = (UILabel *)[cell viewWithTag:300];
        UILabel *deviceProfile = (UILabel *)[cell viewWithTag:400];
        UILabel *downloadSpeed = (UILabel *)[cell viewWithTag:500];
        UILabel *uploadSpeed = (UILabel *)[cell viewWithTag:600];
        UILabel *percentage = (UILabel *)[cell viewWithTag:700];
        UIImageView *picture = (UIImageView *)[cell viewWithTag:800];
        UIImageView *signalStrengthImage = (UIImageView*)[cell viewWithTag:10];
        picture.layer.cornerRadius=picture.frame.size.width/2;
        picture.clipsToBounds = YES;
        [picture layoutIfNeeded];
        signalStrengthImage.layer.cornerRadius=signalStrengthImage.frame.size.width/2;
        signalStrengthImage.clipsToBounds = YES;
        [signalStrengthImage layoutIfNeeded];

        if ([[dict objectForKey:@"type"] containsString:@"Mac"]) {
            picture.image = [UIImage imageNamed:@"Macbook"];
        }
        if ([[dict objectForKey:@"type"] containsString:@"Phone"]) {
            picture.image = [UIImage imageNamed:@"iPhone"];
        }
        if ([[dict objectForKey:@"type"] containsString:@"TV"]) {
            picture.image = [UIImage imageNamed:@"Apple TV"];
        }
        
        NSArray *addDeviceName =[[NSArray alloc] initWithObjects:[dict objectForKey:@"name"] ,[dict objectForKey:@"type"] , nil] ;
        NSString *joinStringsToCreateDeviceName = [addDeviceName componentsJoinedByString:@"'s "];
        deviceName.text = joinStringsToCreateDeviceName;
        signalStrength.text = [dict objectForKey:@"signal"];
        member.text = [dict objectForKey:@"profile_type"];
        deviceProfile.text = [dict objectForKey:@"profile_type"];
        downloadSpeed.text = [[dict objectForKey:@"download_speed"] stringByAppendingString:@" Mbps"];
        uploadSpeed.text =[[dict objectForKey:@"upload_speed"]  stringByAppendingString:@" Mbps"];
        percentage.text = [[dict objectForKey:@"usage"] stringByAppendingString:@"%"];
        
        
        if([signalStrength.text isEqualToString:@"Weak"]){
            signalStrengthImage.backgroundColor = [UIColor colorWithRed:223/255.0 green:88/255.0 blue:92/255.0 alpha:1];
        }
        if(  [signalStrength.text isEqualToString:@"Excellent"]){
            signalStrengthImage.backgroundColor = [UIColor colorWithRed:104/255.0 green:185/255.0 blue:10/255.0 alpha:1];
        }
        if( [signalStrength.text isEqualToString:@"Verygood"]){
            signalStrengthImage.image=[UIImage imageNamed:@"VeryGood"];
        }
        if([signalStrength.text isEqualToString:@"Good"]){
            signalStrengthImage.backgroundColor = [UIColor colorWithRed:245/255.0 green:166/255.0 blue:35/255.0 alpha:1];
        }
        if ([signalStrength.text isEqualToString:@"Ethernet"]){
            signalStrengthImage.image=[UIImage imageNamed:@"Ethernet"];
            
        }
        
        
        [self.control setCount:[NSNumber numberWithUnsignedInteger:_devicesData.connectedDevicesList.count] forSegmentAtIndex:0];
        [self.control setCount:[NSNumber numberWithUnsignedInteger:_devicesData.excellentSignalStrengthDeviceIndices.count] forSegmentAtIndex:1];
        [self.control setCount:[NSNumber numberWithUnsignedInteger:_devicesData.verygoodSignalStrengthDeviceIndices.count] forSegmentAtIndex:4];
        [self.control setCount:[NSNumber numberWithUnsignedInteger:_devicesData.weakSignalStrengthDeviceIndices.count] forSegmentAtIndex:3];
        [self.control setCount:[NSNumber numberWithUnsignedInteger:_devicesData.goodSignalStrengthDeviceIndices.count] forSegmentAtIndex:2];
    }
    return cell;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //return self.devicesAndUsersSegmentBar;
    if (![_devicesAndUsersSegmentBar selectedSegmentIndex]) {
        return self.control;
    }
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch ([_devicesAndUsersSegmentBar selectedSegmentIndex]) {
        case 0:
            if ([_control selectedSegmentIndex]==0)
                return _devicesData.connectedDevicesList.count;
            else if ([_control selectedSegmentIndex]==1)
                return _devicesData.excellentSignalStrengthDeviceIndices.count;
            else if ([_control selectedSegmentIndex]==2)
                return _devicesData.goodSignalStrengthDeviceIndices.count;
            else if ([_control selectedSegmentIndex]==3)
                return _devicesData.weakSignalStrengthDeviceIndices.count;
            else
                return _devicesData.verygoodSignalStrengthDeviceIndices.count;
            
            break;
        case 1:
            return _userDeviceArray.count;
            
    }
    
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 50;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"CreateANewUserSegue"]) {
    }

    
    
    switch (_devicesAndUsersSegmentBar.selectedSegmentIndex) {
        case 0:{
            if ([_control selectedSegmentIndex] ==1 )
            {
                
                NSLog(@"kdghrfzfrzlpk  %@",[_devicesData.excellentSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row]);
                
                _temp1 =  [_devicesData.connectedDevicesList objectAtIndex:[[_devicesData.excellentSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row] unsignedIntegerValue]];
                
            }
            
            if ([_control selectedSegmentIndex] ==3) {
                
                NSLog(@"%lu",[[_devicesData.weakSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row] unsignedIntegerValue]);
                
                _temp1 =  [_devicesData.connectedDevicesList objectAtIndex:[[_devicesData.weakSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row] unsignedIntegerValue]];
                NSLog(@"%@",_temp1);
                
                
                
            }
            
            if ([_control selectedSegmentIndex] ==4) {
                NSLog(@"%lu",[[_devicesData.verygoodSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row] unsignedIntegerValue]);
                
                _temp1 =  [_devicesData.connectedDevicesList objectAtIndex:[ [_devicesData.verygoodSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row] unsignedIntegerValue]];
                NSLog(@"%@",_temp1);
                
                
            }
            if ([_control selectedSegmentIndex] ==2) {
                NSLog(@"%lu",[[_devicesData.goodSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row] unsignedIntegerValue]);
                
                _temp1 =  [_devicesData.connectedDevicesList objectAtIndex:[ [_devicesData.goodSignalStrengthDeviceIndices objectAtIndex:_tableView.indexPathForSelectedRow.row]unsignedIntegerValue]];
                NSLog(@"%@",_temp1);
                
                
            }
            if ([_control selectedSegmentIndex] ==0) {
                NSLog(@"%lu",_tableView.indexPathForSelectedRow.row );
                _temp1 = [_devicesData.connectedDevicesList objectAtIndex:_tableView.indexPathForSelectedRow.row];
                NSLog(@"%@",_temp1);
                
            }
            
            
            UIBarButtonItem *newBackButton =
            [[UIBarButtonItem alloc] initWithTitle:@""
                                             style:UIBarButtonItemStylePlain
                                            target:nil
                                            action:nil];
            
            [[self navigationItem] setBackBarButtonItem:newBackButton];
            
            // Make sure your segue name in storyboard is the same as this line
            if ([[segue identifier] isEqualToString:@"ShowDeviceInfoSegue"])
            {
                //if you need to pass data to the next controller do it here
                DeviceInfoTableViewController *deviceInfoTableViewController = segue.destinationViewController;
                deviceInfoTableViewController.deviceData = _temp1;
                deviceInfoTableViewController.selectedSegment = [NSNumber numberWithInteger:[_devicesAndUsersSegmentBar selectedSegmentIndex]];
            }

        }
            
            break;
        case 1:
            if ([[segue identifier] isEqualToString:@"ShowUserInfoSegue"])
            {
                //if you need to pass data to the next controller do it here
                UserInfoViewController *uivc = segue.destinationViewController;
                //uivc.userNameTemp = [_userNameArray objectAtIndex:_tableView.indexPathForSelectedRow.row];
                //uivc.userProfileTemp = [_userProfileArray objectAtIndex:_tableView.indexPathForSelectedRow.row];
                //uivc.userIndex = _tableView.indexPathForSelectedRow.row;
                uivc.selectedUser = _tableView.indexPathForSelectedRow.row;
            }
            
            break;
    }
    
    
}



- (IBAction)toggleDeviceMap:(id)sender {
    
    [self.view layoutIfNeeded];
    
    UIButton *toggleButton = (UIButton *)sender;
    if([toggleButton.titleLabel.text containsString:@"Hide"]){
        [toggleButton setTitle:@"Show Devices Map" forState:UIControlStateNormal];
        self.devicesMapHeightConstraint.constant = 0;
    }
    else{
        [toggleButton setTitle:@"Hide Devices Map" forState:UIControlStateNormal];
        self.devicesMapHeightConstraint.constant = DEVICES_MAP_HEIGHT;
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(IBAction)createANewUser:(id)sender{
    [self performSegueWithIdentifier:@"CreateANewUserSegue" sender:self];
}



#pragma mark - DZNControl methods
- (DZNSegmentedControl *)control
{
    if (!_control)
    {
        _control = [[DZNSegmentedControl alloc] initWithItems:self.menuItems];
        _control.delegate = self;
        _control.selectedSegmentIndex = 0;
        _control.bouncySelectionIndicator = NO;
        _control.height = 60.0f;
        
        //                _control.height = 120.0f;
        //                _control.width = 300.0f;
        _control.showsGroupingSeparators = YES;
        //                _control.inverseTitles = YES;
        //_control.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:249/255.0 alpha:1];
        _control.tintColor = [UIColor colorWithRed:0 green:176/255.0 blue:185/255.0 alpha:1];
        //                _control.hairlineColor = [UIColor purpleColor];
        //                _control.showsCount = NO;
        _control.autoAdjustSelectionIndicatorWidth = YES;
        //                _control.selectionIndicatorHeight = 4.0;
        //                _control.adjustsFontSizeToFitWidth = YES;
        _control.showsCount=YES;
        
        [_control addTarget:self action:@selector(didChangeSegment:) forControlEvents:UIControlEventValueChanged];
    }
    //[self updateControlCounts];
    return _control;
}

- (DZNSegmentedControl *)devicesAndUsersSegmentBar
{
    if (!_devicesAndUsersSegmentBar)
    {
        _devicesAndUsersSegmentBar = [[DZNSegmentedControl alloc] initWithItems:_devicesAndUsersSegmentItems];
        _devicesAndUsersSegmentBar.delegate = self;
        _devicesAndUsersSegmentBar.selectedSegmentIndex = 0;
        _devicesAndUsersSegmentBar.bouncySelectionIndicator = NO;
        //_devicesAndUsersSegmentBar.height = 50.0f;
        _devicesAndUsersSegmentBar.frame = CGRectMake(35, 30, self.view.frame.size.width-70, self.tableView.tableHeaderView.frame.size.height);
        
        //                _control.height = 120.0f;
        //_devicesAndUsersSegmentBar.width = 100.0f;
        _devicesAndUsersSegmentBar.showsGroupingSeparators = YES;
        //                _control.inverseTitles = YES;
        //_devicesAndUsersSegmentBar.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:249/255.0 alpha:1];
        _devicesAndUsersSegmentBar.tintColor = [UIColor colorWithRed:0 green:176/255.0 blue:185/255.0 alpha:1];
        //                _control.hairlineColor = [UIColor clearColor];
        //                _control.showsCount = NO;
        _devicesAndUsersSegmentBar.autoAdjustSelectionIndicatorWidth = YES;
        //                _control.selectionIndicatorHeight = 4.0;
        //                _control.adjustsFontSizeToFitWidth = YES;
        //_devicesAndUsersSegmentBar.showsCount=YES;
        
        
        [_devicesAndUsersSegmentBar addTarget:self action:@selector(didChangeSegment:) forControlEvents:UIControlEventValueChanged];
    }
    //[self updateControlCounts];
    return _devicesAndUsersSegmentBar;
}

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view
{
    return UIBarPositionAny;
}

- (UIBarPosition)positionForSelectionIndicator:(id<UIBarPositioning>)bar
{
    return UIBarPositionAny;
}

- (void)didChangeSegment:(DZNSegmentedControl *)control
{
    
    
    if ([_devicesAndUsersSegmentBar selectedSegmentIndex]==1) {
        self.devicesMapHeightConstraint.constant = 0;
        self.toggleButtonHeightConstraint.constant = 0;
        //_toggleButton.hidden = YES;
        [self.tableView setContentInset:UIEdgeInsetsMake(-50,0,0,0)];
        self.tableView.sectionHeaderHeight = 0;
        
        if (_addUserButton.hidden == YES) {
            _addUserButton.hidden = NO;
        }
    }
    else{
        if ([_toggleButton.currentTitle containsString:@"Hide"]) {
            self.devicesMapHeightConstraint.constant = DEVICES_MAP_HEIGHT ;
        } else {
            self.devicesMapHeightConstraint.constant = 0;
        }
        _addUserButton.hidden = YES;
        self.toggleButtonHeightConstraint.constant = 23;
        //_devicesMapView.hidden= NO;
        [self.tableView setContentInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    [_tableView reloadData];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
}

@end

@implementation DevicesMapView


-(void)drawRect:(CGRect)rect{
    [self drawCanvas1WithFrame:rect];
}

- (void)drawCanvas1WithFrame: (CGRect)frame
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* orange = [UIColor colorWithRed: 1 green: 0.647 blue: 0 alpha: 1];
    
    //// Shadow Declarations
    NSShadow* ellipseBackgroundShadow = [[NSShadow alloc] init];
    ellipseBackgroundShadow.shadowColor = [UIColor.lightGrayColor colorWithAlphaComponent: 0.4];
    ellipseBackgroundShadow.shadowOffset = CGSizeMake(0, 0);
    ellipseBackgroundShadow.shadowBlurRadius = 10;
    NSShadow* currentDeviceShadow = [[NSShadow alloc] init];
    currentDeviceShadow.shadowColor = [UIColor.greenColor colorWithAlphaComponent: 0.64];
    currentDeviceShadow.shadowOffset = CGSizeMake(10, -10);
    currentDeviceShadow.shadowBlurRadius = 60;
    
    //// poor Drawing
    UIBezierPath* poorPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 18, CGRectGetMinY(frame) + 9, 286, 231)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [UIColor.whiteColor setFill];
    [poorPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// good Drawing
    UIBezierPath* goodPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 39, CGRectGetMinY(frame) + 29, 243, 193)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [UIColor.whiteColor setFill];
    [goodPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// veryGood Drawing
    UIBezierPath* veryGoodPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 68, CGRectGetMinY(frame) + 47, 190, 154)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [UIColor.whiteColor setFill];
    [veryGoodPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// excellent Drawing
    UIBezierPath* excellentPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 121, CGRectGetMinY(frame) + 93, 79, 62)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [UIColor.whiteColor setFill];
    [excellentPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// centerCircle Drawing
    UIBezierPath* centerCirclePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 157, CGRectGetMinY(frame) + 121, 8, 8)];
    [UIColor.whiteColor setFill];
    [centerCirclePath fill];
    [UIColor.blackColor setStroke];
    centerCirclePath.lineWidth = 0.4;
    [centerCirclePath stroke];
    
    
    //// redDot Drawing
    UIBezierPath* redDotPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 144, CGRectGetMinY(frame) + 105, 6, 6)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [UIColor.redColor setFill];
    [redDotPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// greenDot Drawing
    UIBezierPath* greenDotPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 200, CGRectGetMinY(frame) + 169, 6, 6)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [UIColor.greenColor setFill];
    [greenDotPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// orangeDot Drawing
    UIBezierPath* orangeDotPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 145, 6, 6)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [orange setFill];
    [orangeDotPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 56, CGRectGetMinY(frame) + 188, 6, 6)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, ellipseBackgroundShadow.shadowOffset, ellipseBackgroundShadow.shadowBlurRadius, [ellipseBackgroundShadow.shadowColor CGColor]);
    [UIColor.redColor setFill];
    [oval3Path fill];
    CGContextRestoreGState(context);
    
    
    
    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 228, CGRectGetMinY(frame) + 117, 6, 6)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, currentDeviceShadow.shadowOffset, currentDeviceShadow.shadowBlurRadius, [currentDeviceShadow.shadowColor CGColor]);
    [UIColor.greenColor setFill];
    [oval4Path fill];
    CGContextRestoreGState(context);
}





@end
