//
//  ViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "RootViewController.h"

@interface ViewController : RootViewController

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *addressLable;
@property (weak, nonatomic) IBOutlet UILabel *brithdayLable;
@property (weak, nonatomic) IBOutlet UILabel *babySexLable;
@property (weak, nonatomic) IBOutlet UIButton *change;
@property (weak, nonatomic) IBOutlet UITableView *setTableView;

- (IBAction)changeImformation:(id)sender;


@end
