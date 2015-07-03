//
//  DiscussCell.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "DiscussCell.h"

@implementation DiscussCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _backImage=[[UIImageView alloc]init];
        _backImage.userInteractionEnabled=YES;
        [self.contentView addSubview:_backImage];
        
        _headImage=[[UIImageView alloc]initWithFrame:CGRectMake(15 ,15, 40, 40)];
        _headImage.backgroundColor=[UIColor redColor];
        [_backImage addSubview:_headImage];
        
        _anthorLable=[[UILabel alloc]initWithFrame:CGRectMake(70, 15, SCREEN_WIDTH-100, 20)];
        _anthorLable.font=[UIFont systemFontOfSize:14];
//        _anthorLable.backgroundColor=[UIColor yellowColor];
        _anthorLable.adjustsFontSizeToFitWidth=YES;
        [_backImage addSubview:_anthorLable];
        
        _timeLable=[[UILabel alloc]initWithFrame:CGRectMake(70, 35 , SCREEN_WIDTH-100, 20)];
        _timeLable.font=[UIFont systemFontOfSize:14];
        _timeLable.adjustsFontSizeToFitWidth=YES;
        [_backImage addSubview:_timeLable];

                
        _infoLable=[[UILabel alloc]initWithFrame:CGRectMake(70, 65, SCREEN_WIDTH-110, 20)];
        _infoLable.font=[UIFont systemFontOfSize:14];
        _infoLable.numberOfLines=0;
        //        折行方式
        _infoLable.lineBreakMode=NSLineBreakByCharWrapping;
        [_backImage addSubview:_infoLable];
        
        
        _subImage=[[UIImageView alloc]initWithFrame:CGRectMake(70, 85, 60, 60)];
        _subImage.hidden=YES;
        [_backImage addSubview:_subImage];
        
        
    
        _menuView=[[UIView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH-20, 25)];
        [_backImage addSubview:_menuView];
        
        _leftBtn=[DiscussBtn buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(15, 0, (SCREEN_WIDTH-50)/3.0, 25);
        [_leftBtn setImage:[UIImage imageNamed:@"support0@2x"] forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"support1@2x"] forState:UIControlStateSelected];
        _leftBtn.layer.borderColor=[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1].CGColor;
        _leftBtn.layer.borderWidth=0.5;
        _leftBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        [_leftBtn setTitle:@"12" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_menuView addSubview:_leftBtn];
        
        _midBtn=[DiscussBtn buttonWithType:UIButtonTypeCustom];
        _midBtn.frame=CGRectMake((SCREEN_WIDTH-50)/3.0+15, 0, (SCREEN_WIDTH-50)/3.0, 25);
        _midBtn.layer.borderColor=[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1].CGColor;
        _midBtn.selected=NO;
        _midBtn.titleLabel.font=[UIFont systemFontOfSize:13];
        _midBtn.layer.borderWidth=0.5;
        [_midBtn setTitle:@"123" forState:UIControlStateNormal];
        [_midBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_midBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [_midBtn setImage:[UIImage imageNamed:@"share0@2x"] forState:UIControlStateNormal];
        [_midBtn setImage:[UIImage imageNamed:@"share1@2x"] forState:UIControlStateSelected];
        [_menuView addSubview:_midBtn];
        
        
        _rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame=CGRectMake((SCREEN_WIDTH-50)/3.0*2+15, 0, (SCREEN_WIDTH-50)/3.0, 25);
        _rightBtn.layer.borderColor=[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1].CGColor;
        [_rightBtn setImage:[UIImage imageNamed:@"edit@2x"] forState:UIControlStateNormal];
        _rightBtn.layer.borderWidth=0.5;
        [_menuView addSubview:_rightBtn];

        
        self.selectionStyle=UITableViewCellSelectionStyleNone;

    }
    return  self;
}



- (void)awakeFromNib {
    // Initialization code
}

//-(void)setSelected:(BOOL)selected
//{
//    _midBtn.selected=!selected;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
