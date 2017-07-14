//
//  AnalyticsPageViewController.m
//  Vayuyan
//
//  Created by sujith on 4/10/17.
//  Copyright © 2017 Vayuyan. All rights reserved.
//

#import "AnalyticsPageViewController.h"
#import "InternetConncetionViewController.h"
#import "DataUsageViewController.h"
#import "ParentalInsightsViewController.h"
#import "SentimentAnalysisViewController.h"

@interface AnalyticsPageViewController ()<UIPageViewControllerDataSource>{

    NSUInteger pageIndex;

}
@end

@implementation AnalyticsPageViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    _viewControllers = @[@"InternetConnectionController",@"DataUsageController",@"ParentalInsightsController",@"SentimentAnalysisController"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *setViewControllerArray = @[startingViewController];
    [self.pageViewController setViewControllers:setViewControllerArray direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIViewController *)viewControllerAtIndex:(NSUInteger)index{
    
    if(index >= _viewControllers.count){
        
        return nil;
    }
    
    if (index == 0) {
        InternetConncetionViewController *fvc = [self.storyboard instantiateViewControllerWithIdentifier:@"InternetConnectionController"];
        
        return fvc;
    }
    
    else if(index == 1){
        
        DataUsageViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"DataUsageController"];
        return svc;
        
    }
    
    else if(index == 2){
        
        ParentalInsightsViewController *tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"ParentalInsightsController"];
        return tvc;
        
    }
    
    else if(index == 3){
        
        SentimentAnalysisViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SentimentAnalysisController"];
        return svc;
        
    }

    return nil;
    
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
  
    pageIndex = [_viewControllers indexOfObject:viewController.restorationIdentifier];
    
    NSLog(@"Before %@", viewController.restorationIdentifier);
    NSLog(@"Before %lu", (unsigned long)[_viewControllers indexOfObject:viewController.restorationIdentifier]);
    NSLog(@"Before %lu", pageIndex);
    
    
    if (pageIndex == 0) {
        return nil;
    }
    
    return [self viewControllerAtIndex:pageIndex - 1];
    
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController  viewControllerAfterViewController:(UIViewController *)viewController
{
    pageIndex = [_viewControllers indexOfObject:viewController.restorationIdentifier];
    
    if (pageIndex == NSNotFound || pageIndex >=_viewControllers.count) {
        
        return nil;
    }
    NSLog(@"After %@", viewController.restorationIdentifier);
    NSLog(@"After %lu", [_viewControllers indexOfObject:viewController.restorationIdentifier]);
    NSLog(@"After %lu", pageIndex);
    
    return [self viewControllerAtIndex:(pageIndex+1)];
    
}




- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return _viewControllers.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
@end
