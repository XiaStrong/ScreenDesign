//
//  Support_Deny_Button.m
//  八戒育儿
//
//  Created by 夏强 on 15/1/16.
//  Copyright (c) 2015年 Xia_Q. All rights reserved.
//

#import "Support_Deny_Button.h"

@implementation Support_Deny_Button

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(AUTO_MATE_WIDTH(30)+20, 14.5 , AUTO_MATE_WIDTH(100-30)-20, 20);
//    return CGRectMake((SCREEN_WIDTH-50)/3.0-, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(AUTO_MATE_HEIGHT(30), 14.5, 20, 20);
}


@end
