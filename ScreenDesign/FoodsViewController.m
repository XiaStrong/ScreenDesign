//
//  FoodsViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/15.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "FoodsViewController.h"
#import "FoodShowViewController.h"
@interface FoodsViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UISearchBar *_searchBar;
}

@end

@implementation FoodsViewController

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
    
    [self creatUI];
}

-(void)creatUI
{
    _searchBar=[[UISearchBar alloc]init];
    _searchBar.placeholder=@"请输入您想要了解的食物";
    _searchBar.barTintColor=[UIColor colorWithRed:94/255.0 green:188/255.0 blue:250/255.0 alpha:1];
    self.navigationItem.titleView=_searchBar;
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
//    CGRect rect =[UIScreen mainScreen].bounds;
//    //每个单元格的大小
//    flowLayout.itemSize = CGSizeMake((rect.size.width)/3.0, (rect.size.width-40-10)/3.0*1.2);
//    //滚动方向
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    // 设置各分区上、下、左、右空白的大小。
//    flowLayout.sectionInset = UIEdgeInsetsMake(5, 20, 5, 20);
//    //每列的间距
//    flowLayout.minimumInteritemSpacing=5;
//    //每行的间距
//    flowLayout.minimumLineSpacing=2.5;
    
    //设置代理
    _foodCollectionView.delegate = self;
    _foodCollectionView.dataSource = self;
    
    _foodCollectionView.showsVerticalScrollIndicator = NO;
    _foodCollectionView.backgroundColor=[UIColor clearColor];
    //注册cell和ReusableView（相当于头部）
    [_foodCollectionView registerClass:[FoodCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_foodCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //边距占5*4=20 ，2个
    //图片为正方形，边长：(fDeviceWidth-20)/2-5-5 所以总高(fDeviceWidth-20)/2-5-5 +20+30+5+5 label高20 btn高30 边
    
    CGRect rect=[UIScreen mainScreen].bounds;
    return CGSizeMake((rect.size.width-20-20)/3.0, (rect.size.width-40)/3.0+20);
}

//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(30, 10, 1, 10);//离主视图上下左右的间距
}


#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
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
    FoodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    
    return cell;
}


//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"选择%ld",indexPath.row);
    FoodShowViewController *fsvc=[[FoodShowViewController alloc]init];
    [self.navigationController pushViewController:fsvc animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
