//
//  ProfileDetailViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/5/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "ProfileDetailViewController.h"
#import "LeftImageTextField-Swift.h"

@interface ProfileDetailViewController () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
@property (nonatomic) NSArray *blockedSitesArray;
@property (nonatomic) NSInteger curfewIndicator;
@end

@implementation ProfileDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _curfewIndicator = 0;
    
    [_profileImage layoutIfNeeded];
    _profileImage.layer.cornerRadius=_profileImage.frame.size.width/2;
    _profileImage.clipsToBounds = YES;
    
    _profileName.text = _profileNameData;
    
    _swipeToGoBack.delegate = self;
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
        case 1:
            if(!_blockedSitesArray.count){
                return 1;
            }
            return _blockedSitesArray.count;
        case 2:
            return 1;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier;
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:{
            identifier = @"ContentRatingCellIdentifier";
            cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            GradientSlider *slider = (GradientSlider *)[cell viewWithTag:5400];
            [slider addTarget:self
                       action:@selector(valueChanged:)
             forControlEvents:UIControlEventValueChanged];
            
            return cell;
        }
            break;
        case 1:{
            if (_blockedSitesArray.count) {
                identifier = @"BlockedSitesCellIdentifier";
                cell = [tableView dequeueReusableCellWithIdentifier:identifier];
                
                return cell;
            }
            
            identifier = @"EmptySectionMessageCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            UILabel *message = (UILabel *)[cell viewWithTag:5407];
            message.text = @"No Sites Blocked";
            
            return cell;
        }
            break;
        case 2:{
            if (_curfewIndicator) {
            identifier = @"CurfewCellIdentifier";
            cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
            return  cell;
            }
            
            identifier = @"EmptySectionMessageCellIdentifier";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            UILabel *message = (UILabel *)[cell viewWithTag:5407];
            message.text = @"No Curfew Set";
            
            return cell;
            
        }
            break;
            
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 29)];
    [headerView setBackgroundColor:[UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f]];
    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,tableView.frame.size.width,30)];
    labelHeader.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:12.0f];
    labelHeader.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
    labelHeader.textAlignment = NSTextAlignmentLeft;
    
    switch (section) {
        case 0:
            labelHeader.text = @"  Content Rating";
            break;
        case 1:
            labelHeader.text = @"  Blocked Sites";
            break;
        case 2:
            labelHeader.text = @"  Curfew";
            break;
    }
    
    [headerView addSubview:labelHeader];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(self.view.frame.size.width-33, 0, 30, 25);
    [addButton setImage:[UIImage imageNamed:@"ButtonImage"] forState:UIControlStateNormal];
    //addButton.backgroundColor = [UIColor blueColor];
    [headerView addSubview:addButton];
    
    return headerView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 90;
            break;
        case 1:
            return 45;
        default:
            break;
    }
    return 150;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (void)valueChanged:(id)sender {
    // round the slider position to the nearest index of the numbers array
    
    GradientSlider *slider = sender;
    
    NSUInteger index = (NSUInteger)(slider.value + 0.5);
    [slider setValueWithValue:index animated:YES];
    NSLog(@"sliderIndex: %i", (int)index);
    
    
}

#pragma mark - UIGestureRecognizerDelegate


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // Replace to your view with button
    if ([touch.view isKindOfClass:[GradientSlider class]])
    {
        return NO;
    }
    return YES;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
