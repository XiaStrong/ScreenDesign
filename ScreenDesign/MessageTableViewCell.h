//
//  MessageTableViewCell.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/25.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface MessageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UILabel *editor;

@property (weak, nonatomic) IBOutlet UILabel *reviewcount;


-(void)updataModel:(MessageModel *)model;


@end
