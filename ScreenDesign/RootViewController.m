//
//  RootViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
//        self.tabBarController.tabBar.translucent=NO;
    }

    
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:253/255.0 green:195/255.0 blue:66/255.0 alpha:1];
    
    // Do any additional setup after loading the view from its nib.
}



- (void)setNavgationBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName action:(SEL)action left:(BOOL)left{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn.layer setCornerRadius:15];
    btn.clipsToBounds=YES;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    //通过自定义view初始化UIBarButtonItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if(left) {
        self.navigationItem.leftBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = item;
    }
    
}


- (void)setNavItemTitle:(NSString *)title
{
    self.navigationItem.title = title;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
