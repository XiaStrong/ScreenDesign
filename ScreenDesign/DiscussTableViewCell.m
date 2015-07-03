//
//  DiscussTableViewCell.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "DiscussTableViewCell.h"
#import "Header.h"
@implementation DiscussTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatUI];
        
    }
    return  self;
}


-(void)creatUI
{
    
 
    _infoLable.frame=CGRectMake(65, 65, SCREEN_WIDTH-80, 20);
    _infoLable.font=[UIFont systemFontOfSize:14];
    _infoLable.numberOfLines=0;
    
    //        折行方式
    _infoLable.lineBreakMode=NSLineBreakByCharWrapping;
    //        _infoLable.adjustsFontSizeToFitWidth=YES;
    [self.contentView addSubview:_infoLable];
    
    
    _subImage.frame=CGRectMake(65, 85, 60, 60);
    _subImage.hidden=YES;
    [self.contentView addSubview:_subImage];
    

    
}

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
