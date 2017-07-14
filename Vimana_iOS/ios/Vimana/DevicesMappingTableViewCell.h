//
//  DevicesMappingTableViewCell.h
//  Vayuyan
//
//  Created by kirang on 3/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomView.h"
#import "DZNSegmentedControl.h"

@interface DevicesMappingTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet CustomView *circleview;
@property (nonatomic, strong) DZNSegmentedControl *control;

@property (weak, nonatomic) IBOutlet UIButton *hidebutton;

@property (weak, nonatomic) IBOutlet UIView *segmentView;
@property (weak, nonatomic) IBOutlet UIButton *hideMapAction;
@end
