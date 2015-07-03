//
//  LoginViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/1.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登录";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginBtnClick:(id)sender {
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    ViewController *vc=[[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

@end
