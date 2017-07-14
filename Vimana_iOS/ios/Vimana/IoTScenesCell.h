//
//  IoTScenesCell.h
//  Vayuyan
//
//  Created by sujith on 3/22/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IoTScenesCell : UITableViewCell
@property (weak,nonatomic) IBOutlet UILabel *IoTScenesLabel;
@property (weak,nonatomic) IBOutlet UIButton *IoTScenesSetButton;
- (IBAction)IoTScenesButtonTapped:(id)sender;

@end
