//
//  CityViewController.h
//  八戒育儿
//
//  Created by 肖明 on 14-12-18.
//  Copyright (c) 2014年 Xia_Q. All rights reserved.
//

#import "RootViewController.h"

@protocol CityViewControllerDelegate <NSObject>

-(void)getCityData:(NSString *)city;

@end

@interface CityViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) id<CityViewControllerDelegate>delegate;

-(void)sendCity;

@property(nonatomic, strong) NSMutableDictionary *cities;

@property(nonatomic ,strong) NSMutableArray *keys; //城市首字母
@property(nonatomic ,strong) NSMutableArray *arrayCitys;   //城市数据
@property(nonatomic ,strong) NSMutableArray *arrayHotCity;

@property(nonatomic ,strong) UITableView *cityTabView;

@end
