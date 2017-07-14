//
//  IoTScenesCell.m
//  Vayuyan
//
//  Created by sujith on 3/22/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "IoTScenesCell.h"

@implementation IoTScenesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)IoTScenesButtonTapped:(id)sender {
    
    if ([sender isSelected]) {
        [sender setImage:[UIImage imageNamed:@"SET_ON"] forState:UIControlStateNormal];
        [sender setSelected:NO];
    } else {
        [sender setImage:[UIImage imageNamed:@"SET_OFF"] forState:UIControlStateSelected];
        [sender setSelected:YES];
    }

}
@end
