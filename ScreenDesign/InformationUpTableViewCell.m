//
//  InformationUpTableViewCell.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/29.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "InformationUpTableViewCell.h"

@implementation InformationUpTableViewCell

- (void)awakeFromNib {

    [_headImageView.layer setCornerRadius:20];
    _headImageView.clipsToBounds=YES;
    
    
    _titleLable.textColor=[UIColor colorWithRed:142/255.0 green:142/255.0 blue:142/255.0 alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
