//
//  DiscussViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworking.h"
#import "DiscussTableViewCell.h"
#import "ZHPickView.h"

@interface DiscussViewController : RootViewController<NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTabView;

@end
