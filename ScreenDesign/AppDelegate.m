//
//  AppDelegate.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "DiscussViewController.h"
#import "MessageViewController.h"
#import "InformationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self creat];
    
    return YES;
}

-(void)creat{
    
    MainViewController *mvc=[[MainViewController alloc]init];
    
    UINavigationController *mnav=[[UINavigationController alloc]initWithRootViewController:mvc];
    mvc.title=@"主页";
    mvc.tabBarItem.image=[UIImage imageNamed:@"main"];

    
    DiscussViewController *dvc=[[DiscussViewController alloc]init];
    UINavigationController *dnav=[[UINavigationController alloc]initWithRootViewController:dvc];
    dvc.tabBarItem.image=[UIImage imageNamed:@"discuss"];
    dvc.title=@"吐槽";

    
    
    MessageViewController *nvc=[[MessageViewController alloc]init];
    UINavigationController *nnav=[[UINavigationController alloc]initWithRootViewController:nvc];
    nvc.title= @"资讯";
    nvc.tabBarItem.image=[UIImage imageNamed:@"news"];

    NSArray *vcs=@[mnav,dnav,nnav];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    //UITabBarControllerDelegate 设置delegate
    tabBarController.delegate  = self;
    
    //viewControllers 这是一个数组
    //里面装入 视图控制器
    tabBarController.viewControllers = vcs;
    tabBarController.tabBar.tintColor = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:56.0/255.0 alpha:1];


    
    self.window.rootViewController = tabBarController;


}


#pragma mark UITabBarControllerDelegate method
//当点击某一个item的时候触发
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"vc title %@",viewController.title);
    
    
//    if(viewController.title) {
//        //存数据
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        //写数据
//        [userDefaults setObject:viewController.title forKey:@"title"];
//        //同步
//        [userDefaults synchronize];
//        
//    }
    
}


//当点击more里面的edit的时候触发
//数组里面存储的是改变之前的视图控制器
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers
{
    for(UIViewController *vc in viewControllers) {
        NSLog(@"edit %@",vc.title);
    }
}

//当点击Done的时候触发此事件
//数组存储的是改变顺序之后的视图控制器
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    for(UIViewController *vc in viewControllers) {
        NSLog(@"done %@",vc.title);
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
