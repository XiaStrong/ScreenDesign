//
//  MessageTableViewCell.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/25.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation MessageTableViewCell

-(void)updataModel:(MessageModel *)model
{

    [_icon setImageWithURL:[NSURL URLWithString:model.icon]];
    BOOL ret = [model.stress isEqualToString:@"color:#FF0000"];
    
    if (ret==YES) {
        _title.textColor=[UIColor colorWithRed:221/255.0 green:0 blue:21/255.0 alpha:1];
    }
    
    _title.text=model.title;
    _desc.text=model.desc;
    _editor.text=model.editor;
    _reviewcount.text=model.reviewcount;
    
    
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
