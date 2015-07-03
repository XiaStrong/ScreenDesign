//
//  DetailViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/25.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "DetailViewController.h"
#import "Header.h"
#import "Support_Deny_Button.h"
#import "Collect_Share_Button.h"
#import "CommentViewController.h"
@interface DetailViewController ()
{
    NSString *_content;
    UIButton *_supportBtn;
    UIButton *_denyBtn;
    UIButton *_collectBtn;
    
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    [self getDate];
}

-(void)creatUI
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.tabBarController.tabBar.hidden=YES;
//    _menuView.backgroundColor=[UIColor redColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    [btn.layer setCornerRadius:15];
    btn.clipsToBounds=YES;
//    [btn setTitle:@"评论" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"write"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(comment) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    

    
    NSArray *arr=@[item];
    
    self.navigationItem.rightBarButtonItems = arr;
    
    NSLog(@"%@",_model.title);
    _Title.text=_model.title;
    _TimeAndWriter.text=[NSString stringWithFormat:@"%@   %@",_model.postdate,_model.editor];
    _TimeAndWriter.textAlignment=NSTextAlignmentCenter;
    _WebView.backgroundColor=[UIColor whiteColor];
    
    
    _supportBtn=[Support_Deny_Button buttonWithType:UIButtonTypeCustom];
    _supportBtn.frame=CGRectMake(0, 0, AUTO_MATE_WIDTH(100), 49);
    _supportBtn.tag=20;
    [_supportBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_supportBtn setImage:[UIImage imageNamed:@"support1"] forState:UIControlStateNormal];
    //点赞数
    
    
    [_downView addSubview:_supportBtn];
    
    //    214dadb0e1dc4158f68848df25259a12
    
    _denyBtn=[Support_Deny_Button buttonWithType:UIButtonTypeCustom];
    _denyBtn.frame=CGRectMake(AUTO_MATE_WIDTH(100), 0, AUTO_MATE_WIDTH(100), 49);
    _denyBtn.tag=21;
    [_denyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_denyBtn setImage:[UIImage imageNamed:@"deny1"] forState:UIControlStateNormal];
    
    [_downView addSubview:_denyBtn];
    
    
    _collectBtn=[Collect_Share_Button buttonWithType:UIButtonTypeCustom];
    _collectBtn.frame=CGRectMake(AUTO_MATE_WIDTH(200), 0, AUTO_MATE_WIDTH(60), 40);
    _collectBtn.tag=22;
    [_collectBtn setImage:[UIImage imageNamed:@"collect1"] forState:UIControlStateNormal];
    [_downView addSubview:_collectBtn];

    
    Collect_Share_Button *shareBtn=[Collect_Share_Button buttonWithType:UIButtonTypeCustom];
    shareBtn.frame=CGRectMake(AUTO_MATE_WIDTH(260), 0, AUTO_MATE_WIDTH(60), 49);
    shareBtn.tag=23;
    [shareBtn setImage:[UIImage imageNamed:@"share1"] forState:UIControlStateNormal];
    [_downView addSubview:shareBtn];

    
    
}

-(void)getDate
{
    //http://m.mydrivers.com/app/newsdetail.aspx?id=431740&ver=1.1
    
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://m.mydrivers.com/app/newsdetail.aspx?id=%@&ver=1.1",_model.ID]];
    
    
    
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
    
    NSDictionary *dic=array[0];
    
    [_WebView loadHTMLString:[NSString stringWithFormat:@"%@",[dic objectForKey:@"content"]] baseURL:nil];
    
    
}


-(void)comment{
    CommentViewController *cm=[[CommentViewController alloc]init];
    [self.navigationController pushViewController:cm animated:YES];

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
