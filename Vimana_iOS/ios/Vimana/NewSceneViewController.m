//
//  NewSceneViewController.m
//  Vayuyan
//
//  Created by suryateja on 4/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "NewSceneViewController.h"

@interface NewSceneViewController ()

@property (weak, nonatomic) IBOutlet UILabel *IoTSceneText;
@property (weak, nonatomic) IBOutlet UILabel *IoTSceneLabel;

@end

@implementation NewSceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _sceneName.layer.masksToBounds = NO;
    _sceneName.layer.shadowRadius = 3.0;
    _sceneName.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    _sceneName.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    _sceneName.layer.shadowOpacity = 1.0;
    _sceneName.layer.cornerRadius = 3.0;
    
    
    if (_sceneToEdit != nil) {
        _IoTSceneLabel.text = _sceneToEdit;
        [_IoTSceneText removeFromSuperview];
        [_sceneName removeFromSuperview];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
