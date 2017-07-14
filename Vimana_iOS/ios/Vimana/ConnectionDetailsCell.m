//
//  ConnectionDetailsCell.m
//  Vimana
//
//  Created by Vamsi Chintalapati on 7/18/16.
//  Copyright © 2016 Vimana. All rights reserved.
//

#import "ConnectionDetailsCell.h"

@interface ConnectionDetailsCell ()

@property (strong, readwrite, nonatomic) UIView *containerView;
@property (strong, readwrite, nonatomic) UIImageView *profileView;

@property (strong, readwrite, nonatomic) UILabel *nameHeaderLabel;
@property (strong, readwrite, nonatomic) UILabel *nameLabel;

@property (strong, readwrite, nonatomic) UILabel *ipHeaderLabel;
@property (strong, readwrite, nonatomic) UILabel *ipLabel;

@property (strong, readwrite, nonatomic) UILabel *macHeaderLabel;
@property (strong, readwrite, nonatomic) UILabel *macLabel;

@property (strong, readwrite, nonatomic) UILabel *signalHeaderLabel;
@property (strong, readwrite, nonatomic) UILabel *signalLabel;

@property (strong, readwrite, nonatomic) UILabel *rssiHeaderLabel;
@property (strong, readwrite, nonatomic) UILabel *rssiLabel;

@property (strong, readwrite, nonatomic) UILabel *rateHeaderLabel;
@property (strong, readwrite, nonatomic) UILabel *rateLabel;

@property (strong, readwrite, nonatomic) UILabel *phyHeaderLabel;
@property (strong, readwrite, nonatomic) UILabel *phyLabel;

@property (strong, readwrite, nonatomic) UIImageView *signalImage;

@end

@implementation ConnectionDetailsCell

static const float FONT_SIZE = 12.0;
static const float LABEL_SIZE = 20.0;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];

        _profileView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Sample1.png"]];
        _profileView.layer.masksToBounds = YES;
        _profileView.layer.borderWidth = 2;
        _profileView.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        _nameHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameHeaderLabel.textAlignment = NSTextAlignmentRight;
        _nameHeaderLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_nameHeaderLabel setTextColor:[UIColor blackColor]];
        [_nameHeaderLabel setText:@"Name"];

        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_nameLabel setTextColor:[UIColor blackColor]];
        [_nameLabel setText:@"ArunManis-MacBook-Pro"];

        _ipHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _ipHeaderLabel.textAlignment = NSTextAlignmentRight;
        _ipHeaderLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_ipHeaderLabel setTextColor:[UIColor blackColor]];
        [_ipHeaderLabel setText:@"IP Address"];

        _ipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _ipLabel.textAlignment = NSTextAlignmentLeft;
        _ipLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_ipLabel setTextColor:[UIColor blackColor]];
        [_ipLabel setText:@"192.168.10.10"];

        _macHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _macHeaderLabel.textAlignment = NSTextAlignmentRight;
        _macHeaderLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_macHeaderLabel setTextColor:[UIColor blackColor]];
        [_macHeaderLabel setText:@"MAC Address"];
        
        _macLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _macLabel.textAlignment = NSTextAlignmentLeft;
        _macLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_macLabel setTextColor:[UIColor blackColor]];
        [_macLabel setText:@"5C:16:C1:CB:22:43"];

        _signalHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _signalHeaderLabel.textAlignment = NSTextAlignmentRight;
        _signalHeaderLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_signalHeaderLabel setTextColor:[UIColor blackColor]];
        [_signalHeaderLabel setText:@"Signal Strength"];
        
        _signalLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _signalLabel.textAlignment = NSTextAlignmentLeft;
        _signalLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_signalLabel setTextColor:[UIColor blackColor]];
        [_signalLabel setText:@"Excellent"];

        _rssiHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rssiHeaderLabel.textAlignment = NSTextAlignmentRight;
        _rssiHeaderLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_rssiHeaderLabel setTextColor:[UIColor blackColor]];
        [_rssiHeaderLabel setText:@"RSSI"];
        
        _rssiLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rssiLabel.textAlignment = NSTextAlignmentLeft;
        _rssiLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_rssiLabel setTextColor:[UIColor blackColor]];
        [_rssiLabel setText:@"-51 dBm"];

        _rateHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rateHeaderLabel.textAlignment = NSTextAlignmentRight;
        _rateHeaderLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_rateHeaderLabel setTextColor:[UIColor blackColor]];
        [_rateHeaderLabel setText:@"Data Rate"];
        
        _rateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rateLabel.textAlignment = NSTextAlignmentLeft;
        _rateLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_rateLabel setTextColor:[UIColor blackColor]];
        [_rateLabel setText:@"877 Mb/s"];

        _phyHeaderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _phyHeaderLabel.textAlignment = NSTextAlignmentRight;
        _phyHeaderLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_phyHeaderLabel setTextColor:[UIColor blackColor]];
        [_phyHeaderLabel setText:@"PHY Mode"];
        
        _phyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _phyLabel.textAlignment = NSTextAlignmentLeft;
        _phyLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
        [_phyLabel setTextColor:[UIColor blackColor]];
        [_phyLabel setText:@"802.11a/n/ac"];
        
        [_containerView addSubview:_profileView];
        [_containerView addSubview:_nameHeaderLabel];
        [_containerView addSubview:_nameLabel];
        [_containerView addSubview:_ipHeaderLabel];
        [_containerView addSubview:_ipLabel];
        [_containerView addSubview:_macHeaderLabel];
        [_containerView addSubview:_macLabel];
        [_containerView addSubview:_signalHeaderLabel];
        [_containerView addSubview:_signalLabel];
        [_containerView addSubview:_rssiHeaderLabel];
        [_containerView addSubview:_rssiLabel];
        [_containerView addSubview:_rateHeaderLabel];
        [_containerView addSubview:_rateLabel];
        [_containerView addSubview:_phyHeaderLabel];
        [_containerView addSubview:_phyLabel];
        
        
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        [self.contentView setBackgroundColor:[UIColor blackColor]];
        [self.contentView addSubview:_containerView];
        [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    
    CGRect headerFrame = CGRectMake(10.0, 15.0, 100.0, LABEL_SIZE);
    CGRect ValueFrame = CGRectMake(120.0, 15.0, 200.0, LABEL_SIZE);
    
    _nameHeaderLabel.frame = headerFrame;
    _nameLabel.frame = ValueFrame;
    
    headerFrame.origin.y += LABEL_SIZE;
    ValueFrame.origin.y += LABEL_SIZE;
    _ipHeaderLabel.frame = headerFrame;
    _ipLabel.frame = ValueFrame;

    headerFrame.origin.y += LABEL_SIZE;
    ValueFrame.origin.y += LABEL_SIZE;
    _macHeaderLabel.frame = headerFrame;
    _macLabel.frame = ValueFrame;

    headerFrame.origin.y += LABEL_SIZE;
    ValueFrame.origin.y += LABEL_SIZE;
    _signalHeaderLabel.frame = headerFrame;
    _signalLabel.frame = ValueFrame;

    headerFrame.origin.y += LABEL_SIZE;
    ValueFrame.origin.y += LABEL_SIZE;
    _rssiHeaderLabel.frame = headerFrame;
    _rssiLabel.frame = ValueFrame;

    headerFrame.origin.y += LABEL_SIZE;
    ValueFrame.origin.y += LABEL_SIZE;
    _rateHeaderLabel.frame = headerFrame;
    _rateLabel.frame = ValueFrame;

    headerFrame.origin.y += LABEL_SIZE;
    ValueFrame.origin.y += LABEL_SIZE;
    _phyHeaderLabel.frame = headerFrame;
    _phyLabel.frame = ValueFrame;
    
    CGFloat boundsX = contentRect.origin.x;
    CGFloat width = contentRect.size.width;
    CGFloat height = contentRect.size.height;
    CGRect frame = CGRectMake(boundsX, 15, width, height-15);
    _containerView.frame = frame;
    _containerView.layer.cornerRadius = 6.0f;
    [_containerView setClipsToBounds:NO];

    frame = CGRectMake((boundsX+width)/2.0-15.0, -15, 30, 30);
    _profileView.frame = frame;
    _profileView.layer.cornerRadius = _profileView.frame.size.height/2;
    
//    frame= CGRectMake(boundsX+47, 0, width-(frame.origin.x + frame.size.width)-3, height);
//    userName.frame = frame;
}

@end
