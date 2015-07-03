//
//  RootViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

//设置标题
- (void)setNavItemTitle:(NSString *)title;


//设置左右按钮
- (void)setNavgationBarItemWithTitle:(NSString *)title imageName:(NSString *)imageName action:(SEL)action left:(BOOL)left;

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view;

@end
