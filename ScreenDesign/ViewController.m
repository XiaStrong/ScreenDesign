//
//  ViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "ViewController.h"
#import "RegisterViewController.h"
#import "InformationViewController.h"
#import "SettingViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController
{
    NSArray *_titleArr;
    NSArray *_imageArr;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=YES;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _setTableView.delegate=self;
    _setTableView.dataSource=self;
    self.title=@"个人中心";
    [self creatUI];
    // Do any additional setup after loading the view from its nib.
}

-(void)creatUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 30);
    btn.backgroundColor=[UIColor yellowColor];
    [btn.layer setCornerRadius:15];
    btn.titleLabel.font=[UIFont systemFontOfSize:14];
    btn.clipsToBounds=YES;
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(sign_in) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = item;
    
    _titleArr=@[@"提问历史",@"发表的帖子",@"回复的帖子",@"资讯浏览历史",@"我的收藏"];
    _imageArr=@[@"write@2x",@"person@2x",@"new@2x",@"history@2x",@"like@2x"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return _titleArr.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        static NSString *str=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.textColor=[UIColor grayColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text=_titleArr[indexPath.row];
        cell.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",_imageArr[indexPath.row]]];
        
        return cell;
    }
    else{
        static NSString *str=@"cell1";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.textColor=[UIColor grayColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text=@"设置";
        cell.imageView.image=[UIImage imageNamed:@"site@2x"];
        return cell;

    }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}


-(void)sign_in
{
    RegisterViewController *rvc =[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
    }
    if (indexPath.section==1) {
        SettingViewController *svc=[[SettingViewController alloc]init];
        [self.navigationController pushViewController:svc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
        // Dispose of any resources that can be recreated.
}



- (IBAction)changeImformation:(id)sender {
    InformationViewController *ivc=[[InformationViewController alloc]init];
    [self.navigationController pushViewController:ivc animated:YES];

}
@end
