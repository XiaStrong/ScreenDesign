//
//  CellModel.h
//  123
//
//  Created by mac on 14-9-17.
//  Copyright (c) 2014年 XQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

//arc下用strong，非arc下用copy
@property(nonatomic,strong)NSString *headImage;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,strong)NSString *comment;
@property(nonatomic,strong)NSString *info;
@property(nonatomic,strong)NSString *subimage;
@property(nonatomic,strong)NSString *time;

@end
