//
//  CommentViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "RootViewController.h"
#import "Header.h"
#import "MessageModel.h"
#import "AFNetworking.h"

@interface CommentViewController : RootViewController

@property(nonatomic,strong)MessageModel *model;
@property (weak, nonatomic) IBOutlet UITextField *commenttextField;

@property (weak, nonatomic) IBOutlet UITableView *myTab;
@end
