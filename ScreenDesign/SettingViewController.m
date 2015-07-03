//
//  SettingViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/1.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "SettingViewController.h"
#import "IdeaBackViewController.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingViewController
{
    NSArray *_dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _SetTableView.delegate=self;
    _SetTableView.dataSource=self;
    CGRect rect=[UIScreen mainScreen].bounds;
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, 20)];
    
    _SetTableView.tableHeaderView=view;

    _SetTableView.backgroundColor=[UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    self.title=@"设置";
    _dataArr=@[@"意见反馈",@"消息通知",@"关于我们",@"消息中心",@"给我评分"];
    
    
    UIView *footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, 60)];
    _SetTableView.tableFooterView=footView;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(30, 30, rect.size.width-60, 30);
    [btn setTitle:@"注销登录" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [footView addSubview:btn];
    
    
    

    // Do any additional setup after loading the view from its nib.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            IdeaBackViewController *ibvc=[[IdeaBackViewController alloc]init];
            [self.navigationController pushViewController:ibvc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=_dataArr[indexPath.row];
    cell.textLabel.textColor=[UIColor grayColor];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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
