//
//  DiscussTableViewCell.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscussTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *anthorLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@property (weak, nonatomic) IBOutlet UILabel *infoLable;

@property (weak, nonatomic) IBOutlet UIImageView *subImage;
@property (weak, nonatomic) IBOutlet UIView *menuView;


@end
