//
//  NewSceneViewController.h
//  Vayuyan
//
//  Created by suryateja on 4/8/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftImageTextField-Swift.h"

@interface NewSceneViewController : UIViewController
@property (weak, nonatomic) IBOutlet LeftImageTextField *sceneName;
@property (weak, nonatomic) NSString *sceneToEdit;
@end
