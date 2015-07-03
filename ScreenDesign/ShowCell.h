//
//  ShowCell.h
//  ScreenDesign
//
//  Created by 夏强 on 15/6/3.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCell : UITableViewCell

@property(strong,nonatomic)UIImageView *backImage;

@property (strong, nonatomic) UIImageView *headImage;
@property (strong, nonatomic)  UILabel *anthorLable;
@property (strong, nonatomic)  UILabel *timeLable;

@property (strong, nonatomic)  UILabel *infoLable;

@property (strong, nonatomic)  UIImageView *subImage;

@end
