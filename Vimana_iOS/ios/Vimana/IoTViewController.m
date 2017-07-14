//
//  IoTViewController.m
//  Vayuyan
//
//  Created by sujith on 3/21/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "IoTViewController.h"
#import "DZNSegmentedControl.h"
#import "IoTGroupedDevicesCell.h"
#import "IoTAllDevicesCell.h"
#import "IoTScenesCell.h"
#import "IoTAutomationCell.h"
#import "CreateAutomationViewController.h"
#import "NewSceneViewController.h"


@interface IoTViewController ()<UITableViewDelegate,UITableViewDataSource,DZNSegmentedControlDelegate>

@property (nonatomic,strong) DZNSegmentedControl *iotSegmentBar;
@property (nonatomic,strong) NSArray *iotSegmentBarItems;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) UIButton *addButton;
@property (nonatomic) UIButton *sectionAddButton;
@property (nonatomic) NSArray *groupedCellDataArray;
    @property (nonatomic) NSArray *groupedCellIotCountArray;
    @property (nonatomic) NSArray *groupedCellIotImageArray;
    @property(nonatomic)  NSArray *allDevicesCellDataArray;
    @property(nonatomic)  NSArray *scenesCellDataArray;
    @property(nonatomic)  NSArray *automationCellDataArray;

@property (nonatomic)
UILabel *noDataLabel;

@end

@implementation IoTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _groupedCellDataArray = @[@"Living Room",@"All Thermostats",@"All Door Locks"];
      _groupedCellIotCountArray = @[@"3",@"1",@"1"];
    _allDevicesCellDataArray =@[@"Living Room 1",@"Living Room 2",@"Living Room 3",@"Thermostat_1",@"Lightify CKBK5634"];
    _scenesCellDataArray = @[@"Date Night",@"Movie Time",@"Good Night",@"Cooking Time"];
    _automationCellDataArray = @[@"Date Night",@"Movie Time",@"Good Night",@"Cooking Time"];
    _groupedCellIotImageArray = @[@"ON_Button",@"OFF_Button",@"DoorUnlocked"];
       [self.tableView setContentInset:UIEdgeInsetsMake(40,0,0,0)];
    self.navigationController.navigationBarHidden = YES;
    _iotSegmentBarItems = @[@"Devices",@"Scenes",@"Automation"];
    _iotSegmentBar = [[DZNSegmentedControl alloc] initWithItems:_iotSegmentBarItems];
    _iotSegmentBar.tintColor = [UIColor colorWithRed:0 green:176/255.0 blue:185/255.0 alpha:1];
    _iotSegmentBar.showsGroupingSeparators = YES;
    _iotSegmentBar.autoAdjustSelectionIndicatorWidth = YES;
    _iotSegmentBar.layer.frame = CGRectMake(0,40, self.tableView.tableHeaderView.frame.size.width, self.tableView.tableHeaderView.frame.size.height+20);
    [_iotSegmentBar addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_iotSegmentBar] ;
     _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addButton.frame = CGRectMake(self.view.frame.size.width-40,30, 25, 25);
    [_addButton setImage:[UIImage imageNamed:@"ButtonImage"] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(addButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_addButton];
    _addButton.hidden = YES;
    [self.tableView reloadData];
    

    _noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height)];
    _noDataLabel.numberOfLines    = 2;
    _noDataLabel.textColor        = [UIColor colorWithRed:134/255.0 green:138/255.0 blue:141/255.0 alpha:1];
    _noDataLabel.font             = [UIFont fontWithName:@"AktivGrotesk-Regular" size:24];
    _noDataLabel.textAlignment    = NSTextAlignmentCenter;
    self.tableView.backgroundView = _noDataLabel;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if ( !_groupedCellDataArray.count && !_allDevicesCellDataArray.count )
        _noDataLabel.text = @"No Smart Home Devices Found";
    else
        _noDataLabel.text = @"";
    
  
    
}

-(IBAction)addButtonSelected:(id)sender{
    switch (_iotSegmentBar.selectedSegmentIndex) {
        case 1:
            [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"CreateANewScene"] animated:YES];            break;
        case 2:
            [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"CreateANewAutomation"] animated:YES];
            break;
    }
}

-(void)changeSegment:(DZNSegmentedControl *) control{
  
    
    
    if(_iotSegmentBar.selectedSegmentIndex == 0){
        
        _addButton.hidden = YES;
        
    }
    else
    {
        if (_addButton.hidden == YES) {
            _addButton.hidden = NO;
        }
    
    }
    switch (_iotSegmentBar.selectedSegmentIndex) {
        case 0:
            if ( !_groupedCellDataArray.count && !_allDevicesCellDataArray.count )
                _noDataLabel.text = @"No Smart Home Devices Found";
            else
                _noDataLabel.text = @"";
            break;
        case 1:
            if ( !_scenesCellDataArray.count  )
                _noDataLabel.text = @"Create a new scene for your Smart Home";
            else
                _noDataLabel.text = @"";

            break;
            
        case 2:
            if ( !_automationCellDataArray.count )
                _noDataLabel.text = @"No Smart Home Devices Found";
            else
                _noDataLabel.text = @"";

            break;
    }
    
    
    
    [self.tableView reloadData];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    switch (_iotSegmentBar.selectedSegmentIndex) {
        case 0:
            if(section == 0){
                
        return  _groupedCellDataArray.count;
            }
        else
        return _allDevicesCellDataArray.count;
        
        case 1:
        return _scenesCellDataArray.count;
        break;
        
        case 2:
        return _automationCellDataArray.count;
        
        default:
        break;
    }
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(_iotSegmentBar.selectedSegmentIndex == 0)
    {
        return 25;
    }
    
    else
        return 0;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_iotSegmentBar.selectedSegmentIndex == 0)
    {
    return  2;
    
    }
    else
        return 1;
    
}

/*- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
    header.textLabel.frame = CGRectMake(50, 20, 100, 15);
    header.textLabel.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
    header.textLabel.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:10.0f];
    header.textLabel.textAlignment = NSTextAlignmentCenter;
    
    _sectionAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sectionAddButton.frame = CGRectMake(header.frame.size.width-40,2.5, 20, 20);
    [_sectionAddButton setImage:[UIImage imageNamed:@"ButtonImage"] forState:UIControlStateNormal];
    
    if(section == 0){
        [header addSubview:_sectionAddButton];
    }

  
}
*/
    - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
        _sectionAddButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sectionAddButton.frame = CGRectMake(headerView.frame.size.width-40,2.5, 20, 20);
        [_sectionAddButton setImage:[UIImage imageNamed:@"ButtonImage"] forState:UIControlStateNormal];
        [headerView addSubview:_sectionAddButton];
        NSArray *titlesArray = @[@"Grouped Devices",@"All Devices"];
        
        UILabel *headerLbl = [[UILabel alloc] initWithFrame:CGRectMake((headerView.frame.size.width/2)- 100, 2.5, 205, 20)];
        headerLbl.text = [titlesArray objectAtIndex:section];
        headerLbl.textColor = [UIColor colorWithRed:88.0/255.0 green:90.0/255.0 blue:89.0/255.0 alpha:1];
        headerLbl.font = [UIFont fontWithName:@"AktivGrotesk-Regular" size:14.0f];
        headerLbl.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:headerLbl];
        headerView.backgroundColor = [UIColor colorWithRed:239.0f/255.0f green:239.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
        if (section != 0) {
            [_sectionAddButton setHidden:YES];
        }
        
        
        return headerView;
    }
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (_iotSegmentBar.selectedSegmentIndex == 0) {
    if (section == 0) {
        return @"Grouped Devices";
    }
    
    else if (section == 1)
        
        return @"All Devices";
    }
    return nil;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (_iotSegmentBar.selectedSegmentIndex == 0) {
        

        if (indexPath.section == 0) {
             NSString *CellIdentifier1 = @"GroupedDevicesCell";
            
            IoTGroupedDevicesCell *groupedDevicesCell = (IoTGroupedDevicesCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
            if (groupedDevicesCell == nil) {
                groupedDevicesCell = [[IoTGroupedDevicesCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:CellIdentifier1];
            
            }
            groupedDevicesCell.groupedCellIoTLabel.text =[_groupedCellDataArray objectAtIndex:indexPath.row];
            groupedDevicesCell.groupedCellDeviceCountLabel.text = [_groupedCellIotCountArray objectAtIndex:indexPath.row];
            [groupedDevicesCell.groupedCellButton setImage:[UIImage imageNamed: [_groupedCellIotImageArray objectAtIndex:indexPath.row] ] forState:UIControlStateNormal];
            return groupedDevicesCell;
        }
        
        else {
             NSString* cellIdentifier2 = @"AllDevicesCell";
            IoTAllDevicesCell *allDevicesCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
            if (allDevicesCell == nil) {
                
                allDevicesCell = [[IoTAllDevicesCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:cellIdentifier2];
            }
            allDevicesCell.allDeviceIoTLabel.text = [_allDevicesCellDataArray objectAtIndex:indexPath.row];

            return allDevicesCell;
        }

    }
    
    else if (_iotSegmentBar.selectedSegmentIndex == 1)
    {
    
     NSString *cellIdentifier3 = @"IoTSceneCell";
        IoTScenesCell *scenesCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier3] ;
        if (scenesCell == nil) {
            scenesCell = [[IoTScenesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier3];
         
        }
           scenesCell.IoTScenesLabel.text = [_scenesCellDataArray objectAtIndex:indexPath.row];
        return scenesCell;
        
    }
    
    else if (_iotSegmentBar.selectedSegmentIndex == 2)
    {
        
        NSString *cellIdentifier = @"IoTAutomationsCell";
        IoTAutomationCell *automationCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
        if (automationCell == nil) {
            automationCell = [[IoTAutomationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        automationCell.IoTAutomationLabel.text = [_automationCellDataArray objectAtIndex:indexPath.row];
        return automationCell;
      
    }
    else
        
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_iotSegmentBar.selectedSegmentIndex == 1){
        NewSceneViewController *nsvc = [self.storyboard instantiateViewControllerWithIdentifier: @"CreateANewScene"];
        nsvc.sceneToEdit = [_scenesCellDataArray objectAtIndex:indexPath.row] ;
        [self.navigationController pushViewController:nsvc animated:YES];
    }
    if (_iotSegmentBar.selectedSegmentIndex == 2  ) {
        CreateAutomationViewController *cavc = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateANewAutomation"];
        cavc.automationName = [_automationCellDataArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:cavc animated:YES];
        
        
    }
}




@end
