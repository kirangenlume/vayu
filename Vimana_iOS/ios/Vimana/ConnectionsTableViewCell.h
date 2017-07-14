//
//  ConnectionsTableViewCell.h
//  Vimana
//
//  Created by Vamsi Chintalapati on 7/13/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectionsTableViewCell : UITableViewCell
//{
//    NSString *reuseID;
//}

    @property (strong, readwrite, nonatomic) UIView *compositeView;
    @property (strong, readwrite, nonatomic) UIImageView *userImage;
    @property (strong, readwrite, nonatomic) UILabel *userName;

@end
