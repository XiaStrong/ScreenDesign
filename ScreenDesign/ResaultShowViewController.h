//
//  ResaultShowViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/6/8.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "RootViewController.h"
#import "ResaultCell.h"

@interface ResaultShowViewController : RootViewController
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;

@property (weak, nonatomic) IBOutlet UITableView *myTabView;
@end
