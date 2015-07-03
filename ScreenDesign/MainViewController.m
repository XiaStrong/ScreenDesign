//
//  MainViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "ResaultShowViewController.h"
#import "FoodsViewController.h"
#import "AnswerViewController.h"
//#import "RegisterViewController.h"
//#import "LoginViewController.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSLog(@"text被点击了");
    //重置第一响应 收键盘
    [textField resignFirstResponder];
    ResaultShowViewController *rsvc=[[ResaultShowViewController alloc]init];
    [self.navigationController pushViewController:rsvc animated:YES];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"已经结束编辑%@",textField.text);
    
    
    NSLog(@"..........");
    
 
    
    //textField.text  是他的文本信息
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
//    UITouch *touch = [touches anyObject];
    
//    CGPoint point = [touch locationInView:self.view];
    
//    NSLog(@"%@",NSStringFromCGPoint(point));
    
    [_tf resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnswerViewController *rsvc=[[AnswerViewController alloc]init];
//    ResaultShowViewController *rsvc=[[ResaultShowViewController alloc]init];
    [self.navigationController pushViewController:rsvc animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationBarItemWithTitle:nil imageName:@"head@2x.jpg" action:@selector(head) left:NO];
    
    _tf.keyboardType = UIKeyboardTypeDefault;
    _tf.delegate=self;
    _tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    _tf.returnKeyType = UIReturnKeySearch;

    _queationTabView.delegate=self;
    _queationTabView.dataSource=self;
    _queationTabView.separatorStyle=UITableViewCellSeparatorStyleNone;
    CGRect rect=[UIScreen mainScreen].bounds;
    
    UIView *headview=[[UIView alloc]initWithFrame:CGRectMake(0, 5, rect.size.width, 40)];
    _queationTabView.tableHeaderView=headview;
    
    UILabel *headlable=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, rect.size.width-20, 30)];
    headlable.text=@"大家都在问";
    headlable.font=[UIFont systemFontOfSize:13];
    [headview addSubview:headlable];
    UIView *hview=[[UIView alloc]initWithFrame:CGRectMake(10, 39, rect.size.width-20, 1)];
    hview.backgroundColor=[UIColor grayColor];
    [headview addSubview:hview];
    
    
    
    
    UIView *footview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, 110)];
    _queationTabView.tableFooterView=footview;
    
   

    UIView *fview=[[UIView alloc]initWithFrame:CGRectMake(10, 0, rect.size.width-20, 1)];
    fview.backgroundColor=[UIColor grayColor];
    [footview addSubview:fview];
    
    
//    UIImageView *view=[self findHairlineImageViewUnder:fview];
    

    UILabel *titleLable=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 20)];
    titleLable.text=@"育儿知识库";
    titleLable.font=[UIFont systemFontOfSize:13];
    [footview addSubview:titleLable];
    
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    //每个单元格的大小
    flowLayout.itemSize = CGSizeMake(60, 80);
    //滚动方向
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    // 设置各分区上、下、左、右空白的大小。
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    //每列的间距
    flowLayout.minimumInteritemSpacing=20;
    //每行的间距
    CGFloat a=(rect.size.width-20-60*4)/3;
    flowLayout.minimumLineSpacing=a;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 25, rect.size.width-20, 80) collectionViewLayout:flowLayout];
    
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [footview addSubview:self.collectionView];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell和ReusableView（相当于头部）
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
    
        
    
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    

    return cell;
}



#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  
    NSLog(@"选择%ld",indexPath.row);
    
    FoodsViewController *fvc=[[FoodsViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
    
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text=@"我是一个经常出现的问题。。。";
    cell.textLabel.textColor=[UIColor grayColor];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)head{
    

    ViewController *vc=[[ViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
