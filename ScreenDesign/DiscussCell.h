//
//  DiscussCell.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "DiscussBtn.h"
@interface DiscussCell : UITableViewCell

@property(strong,nonatomic)UIImageView *backImage;

@property (strong, nonatomic) UIImageView *headImage;
@property (strong, nonatomic)  UILabel *anthorLable;
@property (strong, nonatomic)  UILabel *timeLable;

@property (strong, nonatomic)  UILabel *infoLable;

@property (strong, nonatomic)  UIImageView *subImage;
@property (strong, nonatomic)  UIView *menuView;

@property (strong, nonatomic) DiscussBtn *leftBtn;
@property (strong, nonatomic) DiscussBtn *midBtn;
@property (strong, nonatomic) DiscussBtn *rightBtn;

//-(void)setSelected:(BOOL)selected;

@end
