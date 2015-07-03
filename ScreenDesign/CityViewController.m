//
//  CityViewController.m
//  八戒育儿
//
//  Created by 肖明 on 14-12-18.
//  Copyright (c) 2014年 Xia_Q. All rights reserved.
//

#import "CityViewController.h"
#import "Header.h"
@interface CityViewController ()
{
    UITextField *_cityTf;
}
@end

@implementation CityViewController

-(void)sendCity
{
    [self.delegate getCityData:_cityTf.text];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州市",@"北京市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"无锡市", nil];
        self.keys = [NSMutableArray array];
        self.arrayCitys = [NSMutableArray array];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCityData];
    
    self.title=@"选择城市";
    [self creatUI];
    
    
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
//    {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self sendCity];
}

-(void)sureClick
{
    [self sendCity];
    
    //是自动义按钮的时候要加上这句，不是的话加了就会跳回两次
//    [self.navigationController popViewControllerAnimated:YES];
}


-(void)creatUI
{
   
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _cityTf=[[UITextField alloc]initWithFrame:CGRectMake(AUTO_MATE_WIDTH(10), AUTO_MATE_HEIGHT(5), AUTO_MATE_WIDTH(300), AUTO_MATE_HEIGHT(30))];
    _cityTf.placeholder=@"  请填写您所在城市的名称,或者直接在下选择器选择";
    _cityTf.layer.borderColor=[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1].CGColor;
    _cityTf.layer.borderWidth=1;
    [self.view addSubview:_cityTf];
    
    
    
//    UIButton *sureBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
//    [sureBtn.layer setCornerRadius:AUTO_MATE_WIDTH(5)];
//    sureBtn.backgroundColor=[UIColor colorWithRed:253/255.0 green:143/255.0 blue:39/255.0 alpha:1];
//    sureBtn.frame=CGRectMake(AUTO_MATE_WIDTH(320)-AUTO_MATE_WIDTH(60), 64+AUTO_MATE_HEIGHT(5), AUTO_MATE_WIDTH(50), AUTO_MATE_HEIGHT(30));
//    [sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:sureBtn];
    
    
    _cityTabView=[[UITableView alloc]initWithFrame:CGRectMake(0, AUTO_MATE_HEIGHT(40), AUTO_MATE_WIDTH(320), AUTO_MATE_HEIGHT(568)-AUTO_MATE_HEIGHT(40)) style:UITableViewStylePlain];
    _cityTabView.delegate=self;
    _cityTabView.dataSource=self;
    
    //右侧的导航的背景颜色
    // _cityTabView.sectionIndexTrackingBackgroundColor=[UIColor colorWithRed:242/255.0 green:95/255.0 blue:32/255.0 alpha:1];
    //右侧索引的颜色
    _cityTabView.tintColor=[UIColor colorWithRed:242/255.0 green:95/255.0 blue:32/255.0 alpha:1];
    [self.view addSubview:_cityTabView];
    
    
}

#pragma mark - 获取城市数据
-(void)getCityData
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"
                                                   ofType:@"plist"];
    self.cities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    [self.keys addObjectsFromArray:[[self.cities allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    
    //添加热门城市
    NSString *strHot = @"热门";
    [self.keys insertObject:strHot atIndex:0];
    [self.cities setObject:_arrayHotCity forKey:strHot];
}

#pragma mark - tableView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return AUTO_MATE_HEIGHT(30);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AUTO_MATE_WIDTH(320), AUTO_MATE_HEIGHT(30))];
    bgView.backgroundColor = [UIColor colorWithRed:228/255.0 green:223/255.0 blue:219/255.0 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(AUTO_MATE_WIDTH(13), 0, AUTO_MATE_WIDTH(250), AUTO_MATE_HEIGHT(30))];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:12];
    
    NSString *key = [_keys objectAtIndex:section];
    if ([key rangeOfString:@"热"].location != NSNotFound) {
        titleLabel.text = @"热门城市";
    }
    else
        titleLabel.text = key;
    
    [bgView addSubview:titleLabel];
    
    return bgView;
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    
    return _keys;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [_keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    NSString *key = [_keys objectAtIndex:section];
    NSArray *citySection = [_cities objectForKey:key];
    return [citySection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [_keys objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.textLabel setTextColor:[UIColor blackColor]];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
    }
    cell.textLabel.text = [[_cities objectForKey:key] objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *key = [_keys objectAtIndex:indexPath.section];
    _cityTf.text= [[_cities objectForKey:key] objectAtIndex:indexPath.row];
}

@end
