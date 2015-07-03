//
//  AnswerViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/8.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation AnswerViewController

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
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self creatUI];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)creatUI
{
    CGRect rect=[UIScreen mainScreen].bounds;
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height-64) style:UITableViewStylePlain];
    _tabView.delegate=self;
    _tabView.dataSource=self;
//    _tabView.backgroundColor=[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.000];
    [self.view addSubview:_tabView];
    
    UIView *upView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, 80)];
    _tabView.tableHeaderView=upView;
    
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, rect.size.width-20, 30)];
    lable.text=@"宝宝感冒了怎么办";
    lable.textColor=[UIColor blackColor];
    [upView addSubview:lable];
    
    UILabel *nameLable=[[UILabel alloc]initWithFrame:CGRectMake(10, 50, 200, 20)];
    nameLable.text=@"提问人：呼啦啦";
    nameLable.textColor=[UIColor grayColor];
    nameLable.font=[UIFont systemFontOfSize:13];
    [upView addSubview:nameLable];
    
    UILabel *timeLable=[[UILabel alloc]initWithFrame:CGRectMake(rect.size.width-110, 50, 100, 20)];
    timeLable.text=@"2014-10-09";
    timeLable.textColor=[UIColor grayColor];
    timeLable.font=[UIFont systemFontOfSize:13];
    [upView addSubview:timeLable];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    if(section==1)
    {
        return 5;
    }
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
//        static NSString *str=@"cell";
//        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
//        if (cell==nil) {
            //        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
       UITableViewCell     *cell = [[[NSBundle mainBundle] loadNibNamed:@"Answer2Cell" owner:self options:nil] lastObject];
//        }
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        return cell;
    
    }
    if (indexPath.section==1) {
//        static NSString *str1=@"cell";
//        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str1];
//        if (cell==nil) {
            //        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Answer1Cell" owner:self options:nil] lastObject];
//        }
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        return cell;
 
    }
    
    static NSString *str2=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str2];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str2];
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"Answer1Cell" owner:self options:nil] lastObject];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text=@"阿莫西林颗粒";
    cell.detailTextLabel.text=@"阿莫西林，又名安莫西林或安默西林，是一种最常用的半合成青霉素类广谱β-内酰胺类抗生素，为一种白色粉末，半衰期约为61.3分钟。在酸性条件下稳定，胃肠道吸收率达90%。阿莫西林杀菌作用强，穿透细胞膜的能力也强。是目前应用较为广泛的口服半合成青霉素之一，其制剂有胶囊、片剂、颗粒剂、分散片等等，现在常与克拉维酸合用制成分散片。";
    cell.detailTextLabel.numberOfLines=2;
    cell.detailTextLabel.font=[UIFont systemFontOfSize:12];
    return cell;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect rect=[UIScreen mainScreen].bounds;

    if(section==0)
    {
        
        UIView *view0=[[UIView alloc]initWithFrame:CGRectMake(0, 0,rect.size.width , 40)];
        view0.backgroundColor=[UIColor orangeColor];
        UIImageView *image0=[[UIImageView alloc]initWithFrame:CGRectMake(15, 2.5, 35, 35)];
//        image0.backgroundColor=[UIColor redColor];
        image0.image=[UIImage imageNamed:@"tuijian.jpg"];
        [image0.layer setCornerRadius:35/2.0];
        image0.clipsToBounds=YES;
        [view0 addSubview:image0];
        
        UILabel *lable0=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, 100, 20)];
        lable0.text=@"推荐回答";
        lable0.font=[UIFont boldSystemFontOfSize:16];
        [view0 addSubview:lable0];
     
        return view0;
    }
    
    
    if(section==1)
    {
        UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0,rect.size.width , 40)];
        view1.backgroundColor=[UIColor yellowColor];
        UIImageView *image0=[[UIImageView alloc]initWithFrame:CGRectMake(15, 2.5, 35, 35)];
//        image0.backgroundColor=[UIColor redColor];
        image0.image=[UIImage imageNamed:@"head2"];
        [image0.layer setCornerRadius:35/2.0];
        image0.clipsToBounds=YES;

        [view1 addSubview:image0];
        
        UILabel *lable0=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, 100, 20)];
        lable0.text=@"其他回答";
        lable0.font=[UIFont boldSystemFontOfSize:16];
        [view1 addSubview:lable0];
        return view1;
    }
    else
    {
        UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0,rect.size.width , 40)];
        
        view1.backgroundColor=[UIColor yellowColor];
        
        UIImageView *image0=[[UIImageView alloc]initWithFrame:CGRectMake(15, 2.5, 35, 35)];
        [image0.layer setCornerRadius:35/2.0];
        image0.clipsToBounds=YES;
        image0.image=[UIImage imageNamed:@"yaopin.jpg"];

        [view1 addSubview:image0];
        
        UILabel *lable0=[[UILabel alloc]initWithFrame:CGRectMake(70, 10, 100, 20)];
        lable0.text=@"推荐药品";

        lable0.font=[UIFont boldSystemFontOfSize:16];
        [view1 addSubview:lable0];
        return view1;

    }
}

//添加这句会实现不悬停
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _tabView)
    {
        CGFloat sectionHeaderHeight = 40;
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}


//返回每一个头标的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 190;
    }
    if (indexPath.section==1) {
        return 50;
    }
    return 70;
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
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
