//
//  DiscussViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "DiscussViewController.h"
#import "CellModel.h"
#import "UIImageView+WebCache.h"
#import "GDataXMLNode.h"
#import "DiscussTableViewCell.h"
#import "DiscussCell.h"
#import "LoginViewController.h"
#import "MJRefresh.h"
#import "DetailDiscussViewController.h"
#import "IdeaBackViewController.h"
#import "WriteViewController.h"
@interface DiscussViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation DiscussViewController
{
    NSMutableArray *_dataArr;
    NSMutableArray *_selectArr;
    
    BOOL _isRefresh;
    BOOL _isUpLoad;
    int _page;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    
    _dataArr=[[NSMutableArray alloc]init];
    _selectArr=[[NSMutableArray alloc]init];
    
    [self creatUI];
    [self setNavgationBarItemWithTitle:nil imageName:@"head@2x.jpg" action:@selector(head) left:NO];
    
    [self setNavgationBarItemWithTitle:nil imageName:@"write@3x" action:@selector(write) left:YES];

    [self getData:YES];
}

-(void)write
{
    WriteViewController *idc=[[WriteViewController alloc]init];
    [self presentViewController:idc animated:YES completion:^{
        
    }];
    
}

-(void)creatUI
{
    _myTabView.delegate=self;
    _myTabView.dataSource=self;
    _myTabView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _page=1;
    [_myTabView addHeaderWithTarget:self action:@selector(up)];
    [_myTabView addFooterWithTarget:self action:@selector(down)];

    [self.view addSubview:_myTabView];


}

-(void)getData:(BOOL)isUpdate

{

    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://www.oschina.net/action/api/tweet_list?uid=0&pageIndex=%d&pageSize=20",_page]];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"application/xml", @"text/xml", @"text/plain" ,nil];
    
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
    GDataXMLDocument *doc=[[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    
    GDataXMLElement *oschina=[doc rootElement];//取根节点
    
    //    取
    NSArray *tweetsArray=[oschina elementsForName:@"tweets"];
    
    GDataXMLElement *tweets=[tweetsArray objectAtIndex:0];
    
    //    取tweet 数组
    
    NSArray *tweetArray=[tweets elementsForName:@"tweet"];
    
    if(_isRefresh){
        [_dataArr removeAllObjects];
        _isRefresh = NO;
    }
    
    for(GDataXMLElement *element in tweetArray)
    {
        NSString *headImage=[[[element elementsForName:@"portrait"]lastObject]stringValue];
        NSString *author=[[[element elementsForName:@"author"]lastObject]stringValue];
        NSString *commentCount=[[[element elementsForName:@"commentCount"]lastObject]stringValue];
        NSString *info=[[[element elementsForName:@"body"]lastObject]stringValue];
        NSString *subImage=[[[element elementsForName:@"imgBig"]lastObject]stringValue];
        NSString *time=[[[element elementsForName:@"pubDate"]lastObject]stringValue];
        
        CellModel *model=[[CellModel alloc]init];
        model.headImage=headImage;
        model.author=author;
        model.comment=commentCount;
        model.info=info;
        model.subimage=subImage;
        model.time=time;
        
        [_dataArr addObject:model];
    }
    
    [_myTabView reloadData];
    [_myTabView headerEndRefreshing];
    [_myTabView footerEndRefreshing];

}


-(void)up
{
    _isRefresh = YES;
    _page = 1;
    [self getData:YES];
}

-(void)down
{
    _isUpLoad = YES;
    _page ++;
    [self getData:NO];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *model=_dataArr[indexPath.row];
    

    //动态测试高度
    UIFont *font = [UIFont systemFontOfSize:14.0];
    CGSize size = CGSizeMake(SCREEN_WIDTH-110, CGFLOAT_MAX);
    NSDictionary *dic = [NSDictionary
                         dictionaryWithObjectsAndKeys:font,
                         NSFontAttributeName,nil];
    size = [model.info
            boundingRectWithSize:size
            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
            attributes:dic context:nil].size;

    
    
    if (model.subimage.length==0) {
        return 65+size.height+30+15;
    }else
    {
        return 65+size.height+SCREEN_WIDTH-110+30+15;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *st=@"cell";
    DiscussCell *cell=[tableView dequeueReusableCellWithIdentifier:st];
    if (cell==nil) {
        cell=[[DiscussCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:st];
    }
    
    CellModel *model=_dataArr[indexPath.row];
    [cell.headImage setImageWithURL:[NSURL URLWithString:model.headImage]placeholderImage:[UIImage imageNamed:@"head@2x.jpg"]];
    cell.anthorLable.text=model.author;
    cell.timeLable.text=model.time;
    
    //动态测试高度
    UIFont *font = [UIFont systemFontOfSize:14.0];
    CGSize size = CGSizeMake(SCREEN_WIDTH-110, CGFLOAT_MAX);
    NSDictionary *dic = [NSDictionary
                         dictionaryWithObjectsAndKeys:font,
                         NSFontAttributeName,nil];
    size = [model.info
            boundingRectWithSize:size
            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
            attributes:dic context:nil].size;

    
    
    cell.infoLable.frame=CGRectMake(70, 65, SCREEN_WIDTH-110,size.height);
    cell.infoLable.text=model.info;
    
    if (model.subimage.length==0) {
        cell.subImage.hidden=YES;
        cell.menuView.frame=CGRectMake(0, 65+size.height+5, SCREEN_WIDTH-20, 30);
        
        cell.backImage.frame=CGRectMake(10, 5, SCREEN_WIDTH-20, 65+size.height+30+5);

    }else
    {
        cell.subImage.hidden=NO;
        
        cell.subImage.frame=CGRectMake(70, 65+size.height, SCREEN_WIDTH-110,SCREEN_WIDTH-110);
        
        [cell.subImage setImageWithURL:[NSURL URLWithString:model.subimage]placeholderImage:[UIImage imageNamed:@"1.jpg"]];
        
        cell.menuView.frame=CGRectMake(0, 65+size.height+SCREEN_WIDTH-110+5, SCREEN_WIDTH-20, 30);
       
        cell.backImage.frame=CGRectMake(10, 5, SCREEN_WIDTH-20, 65+size.height+SCREEN_WIDTH-110+30+5);
    }
    
    
    [cell.midBtn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.rightBtn addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.backImage.image=[UIImage imageNamed:@"appdetail_background@2x"];
    
    cell.midBtn.selected = [_selectArr containsObject:indexPath];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
}

-(void)right:(UIButton *)btn
{
    UIView *v = [btn superview];//获取父类view
    UIView *v1 = [v superview];
    UIView *v2 = [v1 superview];
    
    
    DiscussCell *cell = (DiscussCell *)[v2 superview];//获取cell
    NSIndexPath *indexPath = [_myTabView indexPathForCell:cell];//获取cell对应的section

    
    NSLog(@"indexPath:--------%ld",(long)indexPath.row);
    
    DetailDiscussViewController *ddvc=[[DetailDiscussViewController alloc]init];
    ddvc.detailModel=_dataArr[indexPath.row];
    [self.navigationController pushViewController:ddvc animated:YES];
}


-(void)btn:(UIButton *)btn
{
    
    UIView *v = [btn superview];//获取父类view
    UIView *v1 = [v superview];
    UIView *v2 = [v1 superview];
    
    
    DiscussCell *cell = (DiscussCell *)[v2 superview];//获取cell
    
    
//    [cell.midBtn setSelected:YES];
    
    cell.midBtn.selected=!cell.midBtn.selected;
    
    NSIndexPath *indexPath = [_myTabView indexPathForCell:cell];//获取cell对应的section
    [_selectArr addObject:indexPath];
    NSLog(@"indexPath:--------%ld",(long)indexPath.row);
    NSLog(@"indexPath:------%ld",(long)indexPath.section);
    

}

-(void)head{
    LoginViewController *lvc=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
    
    NSLog(@"呼啦啦");
}

@end
