//
//  FoodCollectionViewCell.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/15.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "FoodCollectionViewCell.h"

@implementation FoodCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //        self.backgroundColor = [UIColor purpleColor];
        //        _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetWidth(self.frame)-10)];
        //        _imgView.backgroundColor=[UIColor yellowColor];
        //
//        self.backgroundColor = [UIColor purpleColor];

        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetWidth(self.frame)-10)];
        _imgView.backgroundColor=[UIColor yellowColor];
        [_imgView.layer setCornerRadius:(CGRectGetWidth(self.frame)-10)/2];
        _imgView.clipsToBounds=YES;
        _imgView.image=[UIImage imageNamed:@"shiwu.jpg"];
        self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
        self.text = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.frame)-10, 20)];
        self.text.font=[UIFont systemFontOfSize:15];
        self.text.textAlignment = NSTextAlignmentCenter;
        self.text.text=@"我是水果";
        [self addSubview:self.text];
        
    }
    return self;
}



- (void)awakeFromNib {
    // Initialization code
}

@end
