//
//  DetailDiscussViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/6/3.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface DetailDiscussViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *detailTabView;
@property(nonatomic,strong)CellModel *detailModel;

@property (weak, nonatomic) IBOutlet UIView *backView;

- (IBAction)sureBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *commitTf;

@end
