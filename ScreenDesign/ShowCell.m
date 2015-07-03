//
//  ShowCell.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/3.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "ShowCell.h"
#import "Header.h"
@implementation ShowCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _backImage=[[UIImageView alloc]init];
        _backImage.userInteractionEnabled=YES;
        _backImage.image=[UIImage imageNamed:@"appdetail_background@2x"];

        [self.contentView addSubview:_backImage];
        
        
        _headImage=[[UIImageView alloc]initWithFrame:CGRectMake(15 ,15, 40, 40)];
        _headImage.backgroundColor=[UIColor redColor];
        [_headImage.layer setCornerRadius:20];
        _headImage.clipsToBounds=YES;
        [_backImage addSubview:_headImage];
        
        _anthorLable=[[UILabel alloc]initWithFrame:CGRectMake(70, 25, SCREEN_WIDTH-100, 20)];
        _anthorLable.font=[UIFont systemFontOfSize:16];
        //        _anthorLable.backgroundColor=[UIColor yellowColor];
        _anthorLable.adjustsFontSizeToFitWidth=YES;
        [_backImage addSubview:_anthorLable];
        
        
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(5, 70, SCREEN_WIDTH-30, 0.5)];
        view.backgroundColor=[UIColor grayColor];
        [_backImage addSubview:view];
        
        
        _infoLable=[[UILabel alloc]initWithFrame:CGRectMake(70, 70, SCREEN_WIDTH-110, 20)];
        _infoLable.font=[UIFont systemFontOfSize:16];
        _infoLable.numberOfLines=0;
        //        折行方式
        _infoLable.lineBreakMode=NSLineBreakByCharWrapping;
        [_backImage addSubview:_infoLable];
        
        
        _subImage=[[UIImageView alloc]initWithFrame:CGRectMake(70, 95, SCREEN_WIDTH-110, SCREEN_WIDTH-110)];
        _subImage.hidden=YES;
        [_backImage addSubview:_subImage];
        
        
        
        _timeLable=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-70,95 , SCREEN_WIDTH-110, 20)];
        _timeLable.font=[UIFont systemFontOfSize:14];
        _timeLable.adjustsFontSizeToFitWidth=YES;
        [_backImage addSubview:_timeLable];


        
        
    }
    return self;
}

        
- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
