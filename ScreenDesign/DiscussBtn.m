//
//  DiscussBtn.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/27.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "DiscussBtn.h"

@implementation DiscussBtn

-(id)init
{
    if (self==[super init]) {
    }
    return self;
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((SCREEN_WIDTH-50)/3.0/2-10, 5, 50, 15);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((SCREEN_WIDTH-50)/3.0/2-30, 5, 15, 15);
}


//-(void)setCornerRadius:(int) a withBorderWith: (int) b
//{
//    [self.layer setCornerRadius:a];
//    self.layer.borderColor=[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1].CGColor;
//    self.layer.borderWidth=b;
//}


@end
