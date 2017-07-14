//
//  ConnectionsTableViewCell.m
//  Vimana
//
//  Created by Vamsi Chintalapati on 7/13/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import "ConnectionsTableViewCell.h"

@implementation ConnectionsTableViewCell

@synthesize compositeView;
@synthesize userImage;
@synthesize userName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        reuseID = reuseIdentifier;
        compositeView = [[UIView alloc] initWithFrame:CGRectZero];
        
        NSInteger randomNumber = (arc4random() % 3) + 1;
        NSString *imageName = [NSString stringWithFormat:@"Sample%ld",(long)randomNumber];
        userImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        userImage.layer.masksToBounds = YES;
        userImage.layer.borderWidth = 2;
        userImage.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        userName = [[UILabel alloc]init];
        userName.textAlignment = UITextAlignmentLeft;
        userName.font = [UIFont systemFontOfSize:14];
        [userName setTextColor:[UIColor blackColor]];
        
//        [userName setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
        [userName setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
        [userName setTranslatesAutoresizingMaskIntoConstraints:NO];

        [self.compositeView addSubview:userImage];
        [self.compositeView addSubview:userName];
        [self.contentView addSubview:compositeView];
        
        [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
//        [self.contentView setBackgroundColor:[UIColor blackColor]];
        
    }
    return self;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height;
    CGRect frame = CGRectMake(boundsX+3, 0, width-6, height);
    compositeView.frame = frame;
    frame = CGRectMake(boundsX+7, 7, 30, 30);
    userImage.frame = frame;
    userImage.layer.cornerRadius = userImage.frame.size.height /2;

    frame= CGRectMake(boundsX+47, 0, width-(frame.origin.x + frame.size.width)-3, height);
    userName.frame = frame;
}

@end
