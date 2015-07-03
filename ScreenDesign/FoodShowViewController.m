//
//  FoodShowViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/15.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "FoodShowViewController.h"
#import "FoodShowTableViewCell.h"
@interface FoodShowViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation FoodShowViewController

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
    _foodShowTab.delegate=self;
    _foodShowTab.dataSource=self;
    _foodShowTab.separatorStyle=UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view from its nib.
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str0=@"cell0";
    FoodShowTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str0];
    if (cell==nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodShowTableViewCell" owner:self options:nil] lastObject];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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
