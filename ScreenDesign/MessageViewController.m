//
//  MessageViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"
#import "MessageModel.h"
#import "DetailViewController.h"
#define rect [UIScreen mainScreen].bounds


@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView *_topScrollView;
    NSMutableArray *_dataArray;
    NSArray *_UpdataArray;
    NSMutableArray *_dataArr;

}
@end




@implementation MessageViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden=NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    _dataArray=[[NSMutableArray alloc]init];
    [self creatUI];
//    
//    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    [self getDate];
}

-(void)getDate
{
    //http://m.mydrivers.com/app/newsdetail.aspx?id=431740&ver=1.1

    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://m.mydrivers.com/app/newslist.aspx?tid=0&minId=0&maxId=322291&ver=2.2&temp=1411612450523"]];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSData *data=operation.responseData;
        
        [self analySizeData:data];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Failure: %@", error);
        
        
    }];
    
    [operation start];
}

-(void)analySizeData:(NSData *)data
{
    NSArray *array=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    for (NSDictionary  *dict in array) {
        MessageModel *model=[[MessageModel alloc]init];
        model.icon=[dict objectForKey:@"icon"];
        model.desc=[dict objectForKey:@"desc"];
        model.title=[dict objectForKey:@"title"];
        model.editor=[dict objectForKey:@"editor"];
        model.stress=[dict objectForKey:@"stress"];
        model.postdate=[dict objectForKey:@"postdate"];
        model.reviewcount=[NSString stringWithFormat:@"%@",[dict objectForKey:@"reviewcount"]];
        model.ID = [NSString stringWithFormat:@"%@",[dict objectForKey:@"id"]];
        [_dataArray addObject:model];
        
    }
    
    [_messageTabView reloadData];
    
}


-(void)run
{
    static int i=0;
    
    
    [UIView transitionWithView:_topScrollView duration:1.5 options:UIViewAnimationOptionTransitionNone animations:^{
        _topScrollView.contentOffset=CGPointMake((i%3)*rect.size.width, 0);
        
    } completion:nil];
    
    i++;
}




-(void)creatUI
{

    
    
    _messageTabView.delegate=self;
    _messageTabView.dataSource=self;
    [self.view addSubview:_messageTabView];
     _topScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height*130/480.0)];
    _topScrollView.backgroundColor=[UIColor yellowColor];
    _messageTabView.tableHeaderView=_topScrollView;
    
    
    _topScrollView.pagingEnabled=NO;
    _topScrollView.bounces=NO;
    _topScrollView.delegate=self;

    _UpdataArray=@[@"30.png",@"31.png",@"32.png"];
    
    
    for (int i=0; i<_UpdataArray.count; i++) {
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*rect.size.width, 0, rect.size.width, rect.size.height*130/480.0)];
        
        imageView.image=[UIImage imageNamed:_UpdataArray[i]];
        
        [_topScrollView addSubview:imageView];
    }
    _topScrollView.contentSize=CGSizeMake(rect.size.width*_UpdataArray.count, 0);

}


//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    int page=scrollView.contentOffset.x/320;
//}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"cell";
    MessageTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageTableViewCell" owner:self options:nil] lastObject];
    }
    if (_dataArray.count>0) {
        
        MessageModel *model=_dataArray[indexPath.row];
        [cell updataModel:model];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;

    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //http://m.mydrivers.com/app/newsdetail.aspx?id=431740&ver=1.1
    DetailViewController *dvc=[[DetailViewController alloc]init];
    dvc.model=_dataArray[indexPath.row];
    [self.navigationController pushViewController:dvc animated:YES];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
