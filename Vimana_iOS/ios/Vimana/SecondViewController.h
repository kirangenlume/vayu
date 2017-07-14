//
//  SecondViewController.h
//  Vimana
//
//  Created by Vamsi Chintalapati on 6/29/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

extern NSInteger MoveID;

@property (weak, nonatomic) IBOutlet UISegmentedControl *ConnectionScreen;
@property (nonatomic)   int SelectedSegmentIndex;
- (IBAction)setInternet:(id)sender;

@end

