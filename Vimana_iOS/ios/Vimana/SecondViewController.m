//
//  SecondViewController.m
//  Vimana
//
//  Created by Vamsi Chintalapati on 6/29/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import "SecondViewController.h"
#import "DashboardViewController.h"
#import "VimanaTabBarController.h"
NSInteger  MoveID;
@interface SecondViewController ()


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setInternet:(id)sender {
    MoveID= [_ConnectionScreen selectedSegmentIndex] ;
    NSLog(@"segment value %li    ",(long)MoveID);


}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"SetupComplete"]){
        VimanaTabBarController *controller = (VimanaTabBarController *)segue.destinationViewController;
        controller.segmentIndex = _SelectedSegmentIndex;
    }
}
@end
