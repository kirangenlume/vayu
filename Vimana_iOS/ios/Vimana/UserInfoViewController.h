//
//  UserInfoViewController.h
//  Vayuyan
//
//  Created by suryateja on 4/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *deviceImage;
@property (weak, nonatomic) IBOutlet UILabel *deviceLabel;
@property (weak, nonatomic) IBOutlet UIButton *customFunctionButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
- (IBAction)editUserOrDevice:(id)sender;

@property (nonatomic) NSInteger selectedUser;

@end
