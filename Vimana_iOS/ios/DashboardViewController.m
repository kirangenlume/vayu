//
//  DashboardViewController.m
//  Vayuyan
//
//  Created by suryateja on 3/11/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "DashboardViewController.h"
#import "VimanaTabBarController.h"
#import "GuestAlertViewController.h"
#import "DeviceListModal.h"
#import "UserInfoViewController.h"


@interface DashboardViewController ()
@property (nonatomic) DeviceListModal *devicesData;
@property (nonatomic) NSInteger selectedUser;
-(IBAction)goToUserDetail:(UIButton *)tempButton;

@end

@implementation DashboardViewController


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    if (MoveID == 0) {
        
        CGRect btFrame = _guestRequestButton.frame;
        btFrame.origin.x = self.view.frame.size.width/2-_guestRequestButton.frame.size.width/2;
        //btFrame.origin.y +=30;
        btFrame.origin.y =/*self.view.frame.size.height-80;*/_permissionRequestButton.frame.origin.y-30;
        NSLog(@" %f", btFrame.origin.y);
        btFrame.size.width=170;
        //NSLog(@" %f %f %f %f",self.view.frame.size.width/2, _guestRequestButton.frame.size.width, btFrame.origin.x, self.view.frame.size.height);
        _guestRequestButton.frame = btFrame;
        _guestRequestButton.frame = CGRectMake(self.view.frame.size.width/2-_guestRequestButton.frame.size.width/2, _view4.frame.size.height-80, 170, 32);
        
        _guestRequestButton.backgroundColor = [UIColor colorWithRed:0 green:176/255.0 blue:185/255.0 alpha:100];
        
        
    }
    else{
        CGRect btFrame = _guestRequestButton.frame;
        //btFrame.origin.x = self.view.frame.size.width/2-_guestRequestButton.frame.size.width/2;
        //btFrame.origin.x=5;
        btFrame.origin.y =_permissionRequestButton.frame.origin.y;
        //NSLog(@"adkls;jals;dkfjla;ksfjals %f %f", _view4.frame.size.height-_permissionRequestButton.frame.origin.y, _permissionRequestButton.frame.origin.y);
        btFrame.size.width=135;
        
        //NSLog(@" %f %f %f %f",self.view.frame.size.width/2, _guestRequestButton.frame.size.width, btFrame.origin.x, self.view.frame.size.height);
        //_guestRequestButton.frame = btFrame;
        
        NSDictionary * buttonDic = NSDictionaryOfVariableBindings(_guestRequestButton);
        _guestRequestButton.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSArray *hConstriants = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_guestRequestButton(130)]"
                                                                        options: NSLayoutFormatAlignAllCenterX
                                                                        metrics:nil
                                                                          views:buttonDic];
        [self.view addConstraints:hConstriants];
        
        NSArray *vConstriants = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_guestRequestButton(32)]-22-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:buttonDic];
        [self.view addConstraints:vConstriants];
        
        //_guestRequestButton.frame = CGRectMake(_guestRequestButton.frame.origin.x, _view4.frame.size.height-_permissionRequestButton.frame.origin.y, 135, 32);
        
    }
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%ld", (long)_noOfGuestRequestsTempVariable);
    if (_noOfGuestRequestsTempVariable == 1) {
        _guestRequestButton.hidden = YES;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _devicesData = [[DeviceListModal alloc] init];
  //  NSURL *url = [NSURL URLWithString:@"https://luk0r3ls53.execute-api.us-west-1.amazonaws.com/VimanaQA/device/"];
    //_devicesData.connectedDevicesList= [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url] options:kNilOptions error:nil];
    //[_devicesData segregateDevices];
    
    
    self.navigationController.navigationBarHidden = YES;
    //self.navigationItem.hidesBackButton=YES;
    
    if( MoveID == 0) {
        
        _internetStatus.text=@"Internet Connected";
        _internetStatus.backgroundColor = [UIColor whiteColor];
        _internetStatus.textColor=[UIColor blackColor];
        
        _internetConnectionStatusImage.image= [UIImage imageNamed:@"InternetConnectionAvailable"];
        _internetConnectionStatusExclamation.image = [UIImage imageNamed:@""];
        _speedTestTimeInfo.text=@"Speed tested at 2.38 pm";
        
        _downloadSpeedLabel.text=@"147";
        _uploadSpeedLabel.text=@"11.2";
        
        
        [_permissionRequestButton setHidden:YES];
        
        CGRect btFrame = _guestRequestButton.frame;
        btFrame.origin.x = 100;//self.view.frame.size.width/2-_guestRequestButton.frame.size.width/2;
        
        NSLog(@" %f %f %f",self.view.frame.size.width/2, _guestRequestButton.frame.size.width, btFrame.origin.x);
        _guestRequestButton.frame = btFrame;
        //_GuestRequestButton.frame.origin.x =self.view.frame.size.width/2-_GuestRequestButton.frame.size.width/2;
    }
    else{
        
        
        _internetStatus.text=@"No Internet Connection";
        _internetStatus.textColor=[UIColor whiteColor];
        _internetStatus.backgroundColor = [UIColor redColor];
        
        _internetConnectionStatusImage.image= [UIImage imageNamed:@"InternetConnectionNotAvailable"];
        _internetConnectionStatusExclamation.image = [UIImage imageNamed:@"InternetConnectionNotAvailableExclamation"];
        _speedTestTimeInfo.text=@"No speed test information";
        _downloadSpeedLabel.text=@"--";
        _uploadSpeedLabel.text=@"--";
        
        [_permissionRequestButton setHidden:NO];
        
        CGRect btFrame = _guestRequestButton.frame;
        btFrame.origin.x = 20;//self.view.frame.size.width/2-_GuestRequestButton.frame.size.width/2;
        _guestRequestButton.frame = btFrame;
        
        
    }
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(dismissRequestButton:)
     name:@"dismissRequest"
     object:nil ];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 25, self.view.frame.size.width, 65)];
    int x =20;
    for (int noOfUsers=0 ; noOfUsers<5; noOfUsers++) {
        UIButton *tempButton = [[UIButton alloc] initWithFrame: CGRectMake(10+85*noOfUsers, 5, 50, 50)];
        tempButton.layer.cornerRadius = 25;
        
        [tempButton setImage:[UIImage imageNamed:[@"User" stringByAppendingString:[NSString stringWithFormat:@"%d",1+noOfUsers]]] forState:UIControlStateNormal];
        
        tempButton.tag = noOfUsers;
        [tempButton addTarget:self
                       action:@selector(goToUserDetail:)
             forControlEvents:UIControlEventTouchUpInside];
        
        [scrollView addSubview:tempButton];
        
        x += 85;
    }
    scrollView.contentSize = CGSizeMake(x-35, scrollView.frame.size.height);
    [_usersView addSubview:scrollView];
    
    
    [self viewWillLayoutSubviews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// handling guest requests
-(void)dismissRequestButton: (NSNotification *) notification {
    [_guestRequestButton removeFromSuperview];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"guestRequestSegue"]){
        
        GuestAlertViewController *gavc = segue.destinationViewController;
        gavc.modalPresentationStyle= UIModalPresentationCustom;
    }
    
    if ([segue.identifier isEqualToString:@"DashboardToUserDetailSegue"]) {
        UserInfoViewController *uitvc = segue.destinationViewController;
        uitvc.deviceLabel.text = @"Hello";// [UIImage imageNamed:@"User4"];
        uitvc.selectedUser =_selectedUser;
    }
    
    
}

-(IBAction)goToUserDetail:(UIButton *)tempButton{
    
    _selectedUser = [tempButton tag];
    
    [self performSegueWithIdentifier:@"DashboardToUserDetailSegue" sender:self];
    
}


- (IBAction)handleTapToAnalyticsScreenGesture:(id)sender{
    
    self.tabBarController.selectedIndex = 1;
}

- (IBAction)handleTapToDevicesListScreenGesture:(id)sender {
    self.tabBarController.selectedIndex = 3;
}
@end
