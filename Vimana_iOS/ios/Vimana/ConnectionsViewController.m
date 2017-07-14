//
//  FirstViewController.m
//  Vimana
//
//  Created by Vamsi Chintalapati on 6/29/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import "ConnectionsViewController.h"
#import "ConnectionsTableViewCell.h"
#import "Connection.h"
#import "DevicesScreenTableViewCell.h"

@interface ConnectionsViewController ()
    @property (strong, readwrite, nonatomic) NSArray *weakArray;
    @property (strong, readwrite, nonatomic) NSArray *goodArray;
    @property (strong, readwrite, nonatomic) NSArray *excellentArray;
    @property (strong, readwrite, nonatomic) NSArray *tooCloseArray;
    @property (strong, readwrite, nonatomic) NSMutableDictionary *connectionsDict;
@end

@implementation ConnectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ConnectionsViewController - viewDidLoad");
    
    _weakArray = [self getWeakConnections];
    _goodArray = [self getGoodConnections];
    _excellentArray = [self getExcellentConnections];
    _tooCloseArray = [self getTooCloseConnections];
    
    self.connectionsDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:_weakArray, @"weak", _goodArray, @"good", _excellentArray, @"excellent", _tooCloseArray, @"tooClose", nil];
    NSLog(@"%@", _connectionsDict);
    // 192.168.1.2/cgi-bin/jsonTest.lua
    // http://jsonplaceholder.typicode.com/posts
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (_tooCloseArray.count + _excellentArray.count + _goodArray.count + _weakArray.count);
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return 0;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   /* NSString *sectionTitle = [self getHeaderForSection:section];
    if (sectionTitle == nil) {
        return 2.0;
    }

    return 20.0;*/
    if (section == 0) {
        return 350;
    }
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 109.0;
}

- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section {
    return 2.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

 /*   NSString *sectionTitle = [self getHeaderForSection:section]; // Fetch value for current section
    if (sectionTitle == nil) {
        return nil;
    }
    
    static NSString *kConnectionsReusableHeaderIdentifier = @"connectionsHeaderView";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kConnectionsReusableHeaderIdentifier];
    
    if (headerView == nil) {
        [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:kConnectionsReusableHeaderIdentifier];
        headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kConnectionsReusableHeaderIdentifier];
    }
    
    UILabel *titleLabel = (UILabel *)[headerView.contentView viewWithTag:1];
    if (titleLabel == nil) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 300.0f, 20.0f)];
        titleLabel.tag = 1;
        [titleLabel setTextColor:[UIColor colorWithRed:126.0/255.0 green:134.0/255.0 blue:145.0/255.0 alpha:1.0]];
        [titleLabel setFont:[UIFont systemFontOfSize:10.0f]];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
//        [titleLabel setBackgroundColor:[UIColor grayColor]];
        [headerView.contentView addSubview:titleLabel];
//        [headerView.contentView setBackgroundColor:[UIColor greenColor]];
    }
    titleLabel.text = sectionTitle;
    return headerView;*/
    static NSString *cellIdentifier = @"SectionHeader";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
    }
    return cell.contentView;
}


- (UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *CellIdentifier = @"connectionsIdentifier";
     /*ConnectionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         cell = [[ConnectionsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     }
     Connection *c = [self getConnectionForIndexPath:indexPath];
     if (c != nil) {
         cell.userName.text = [c name];
//         cell.imageView
     }
     cell.layer.cornerRadius = 6.0f;
     [cell setClipsToBounds:YES];
     [cell.contentView setBackgroundColor:[self getBackgroundColorForSection:indexPath.section]];
     return cell;*/
     DevicesScreenTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell==nil) {
         cell = [[DevicesScreenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
         
     }
     cell.deviceName.text = [NSString stringWithFormat:@"Kiran"];
     cell.profilePic.image = [UIImage imageNamed:@"home.png"];
     return cell;
 }

//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    return nil;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //ConnectionDetailViewController *vc = [[ConnectionDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    [self.navigationController pushViewController:vc animated:YES];
}

-(Connection*) nextConnection {
    static int count = 0;
    
    NSString *name = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *image = @"home.png";
    return [[Connection alloc] initWithId:[NSString stringWithFormat:@"%d",count++] name:name andImage:image];
}

-(NSArray*) getWeakConnections {
    return [NSArray arrayWithObjects:[self nextConnection], nil];
}

-(NSArray*) getGoodConnections {
    return [NSArray arrayWithObjects:[self nextConnection], [self nextConnection], nil];
}

-(NSArray*) getExcellentConnections {
    return [NSArray arrayWithObjects:[self nextConnection], [self nextConnection], [self nextConnection], nil];
}

-(NSArray*) getTooCloseConnections {
    return [NSArray arrayWithObjects:[self nextConnection], nil];
}

-(Connection*) getConnectionForIndexPath:(NSIndexPath *) indexPath {
    int index = (int)indexPath.section;
    if (index < _weakArray.count) {
        NSLog(@"Weak: %d", index);
        return [_weakArray objectAtIndex:index];
    } else if(index < (_weakArray.count+_goodArray.count)) {
        NSLog(@"Good: %lu", index - _weakArray.count);
        return [_goodArray objectAtIndex:(index - _weakArray.count)];
    } else if(index < (_excellentArray.count + _goodArray.count + _weakArray.count)) {
        NSLog(@"Excellent %lu", index - (_weakArray.count + _goodArray.count));
        return [_excellentArray objectAtIndex:(index - (_weakArray.count + _goodArray.count))];
    } else if (index < (_tooCloseArray.count + _excellentArray.count + _goodArray.count + _weakArray.count)) {
        NSLog(@"Too Close %lu", index - (_weakArray.count + _goodArray.count + _excellentArray.count));
        return [_tooCloseArray objectAtIndex:(index - (_weakArray.count + _goodArray.count + _excellentArray.count))];
    } else {
        NSLog(@"Index out of bounds!");
        return nil;
    }
}

-(UIColor*) getBackgroundColorForSection:(NSInteger) section {
    int index = (int)section;
    if (index < _weakArray.count) {
        return [UIColor colorWithRed:141.0/255.0 green:35.0/255.0 blue:6.0/255.0 alpha:1.0];
    } else if(index < (_weakArray.count+_goodArray.count)) {
        return [UIColor colorWithRed:183.0/255.0 green:128.0/255.0 blue:0.0/255.0 alpha:1.0];
    } else if(index < (_excellentArray.count + _goodArray.count + _weakArray.count)) {
        return [UIColor colorWithRed:35.0/255.0 green:148.0/255.0 blue:78.0/255.0 alpha:1.0];;
    } else if (index < (_tooCloseArray.count + _excellentArray.count + _goodArray.count + _weakArray.count)) {
        return [UIColor colorWithRed:26.0/255.0 green:39.0/255.0 blue:48.0/255.0 alpha:1.0];;
    } else {
        return nil;
    }
}

-(NSString*) getHeaderForSection:(NSInteger) section {
    int index = (int)section;
    if (index == 0) {
        return @"Weak Signal";
    } else if(index == _weakArray.count) {
        return @"Good Signal";
    } else if(index == (_goodArray.count + _weakArray.count)) {
        return @"Excellent Signal";
    } else if (index == (_excellentArray.count + _goodArray.count + _weakArray.count)) {
        return @"Too Close To Router";
    } else {
        return nil;
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
