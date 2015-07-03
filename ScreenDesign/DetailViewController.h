//
//  DetailViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/25.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
#import "AFNetworking.h"


@interface DetailViewController : UIViewController

@property(nonatomic,strong)MessageModel *model;

@property (weak, nonatomic) IBOutlet UILabel *Title;

@property (weak, nonatomic) IBOutlet UIView *menuView;


@property (weak, nonatomic) IBOutlet UILabel *TimeAndWriter;

@property (weak, nonatomic) IBOutlet UIWebView *WebView;

@property (weak, nonatomic) IBOutlet UIView *downView;

@end
