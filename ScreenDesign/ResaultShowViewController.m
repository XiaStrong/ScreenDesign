//
//  ResaultShowViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/8.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "ResaultShowViewController.h"
#import "AnswerViewController.h"
@interface ResaultShowViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ResaultShowViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"查询";
    _myTabView.delegate=self;
    _myTabView.dataSource=self;
    _mySearchBar.barTintColor=[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.000];
    
    _mySearchBar.tintColor=[UIColor orangeColor];

    [_mySearchBar setScopeButtonTitles:@[@"问题",@"资讯",@"相关"]];

    // Do any additional setup after loading the view from its nib.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"cell";
    ResaultCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        //        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ResaultCell" owner:self options:nil] lastObject];
    }
        
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cell;
    
    
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnswerViewController *avc=[[AnswerViewController alloc]init];
    [self.navigationController pushViewController:avc animated:YES];
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
