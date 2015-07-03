//
//  DetailDiscussViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/3.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "DetailDiscussViewController.h"
#import "Header.h"
#import "ShowCell.h"
#import "UIImageView+WebCache.h"

@interface DetailDiscussViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *_dataArray;
}
@end

@implementation DetailDiscussViewController



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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //注册一个键盘回收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _dataArray=[[NSMutableArray alloc]init];
    [self creatUI];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSLog(@"return被点击了");
    //重置第一响应 收键盘
    [_commitTf resignFirstResponder];
    
    return YES;
}
//当接到键盘回收的通知时我们要做的事情
- (void)keyboardWillHide:(NSNotification *)noti
{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.view.frame = CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT-64);
    }];
}

//当接到通知时我需要实现的方法/我要干的事情
- (void)keyboardWillShow:(NSNotification *)noti
{
    //    NSLog(@"接到通知了");
    //获取键盘的信息
    NSDictionary *userInfo = [noti userInfo];
    
    //    NSLog(@"%@",userInfo);
    
    //去到键盘尺寸信息
    NSValue *value  = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    //转化成CGRect
    CGRect keyboardFrame = [value CGRectValue];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.view.frame = CGRectMake(0, -keyboardFrame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"已经结束编辑%@",textField.text);
    
    
    NSLog(@"..........");
    
    //textField.text  是他的文本信息
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    
    CGPoint point = [touch locationInView:self.view];
    
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    [_commitTf resignFirstResponder];
}

-(void)creatUI
{
    
    _detailTabView.delegate=self;
    _detailTabView.dataSource=self;
    _commitTf.delegate=self;
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        static NSString *str=@"cell1";
        
        ShowCell  *cell=[[ShowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [cell.headImage setImageWithURL:[NSURL URLWithString:_detailModel.headImage]];
        cell.anthorLable.text=_detailModel.author;
        
        //动态测试高度
        UIFont *font = [UIFont systemFontOfSize:16.0];
        CGSize size = CGSizeMake(SCREEN_WIDTH-110, CGFLOAT_MAX);
        NSDictionary *dic = [NSDictionary
                             dictionaryWithObjectsAndKeys:font,
                             NSFontAttributeName,nil];
        size = [_detailModel.info
                boundingRectWithSize:size
                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                attributes:dic context:nil].size;
        
        cell.infoLable.frame =CGRectMake(70, 75, SCREEN_WIDTH-110, size.height);
        cell.infoLable.text=_detailModel.info;

        if (_detailModel.subimage.length==0) {
            cell.subImage.hidden=YES;
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(5, 75+size.height, SCREEN_WIDTH-30, 0.5)];
            line.backgroundColor=[UIColor grayColor];
            [cell.backImage addSubview:line];
            
            cell.timeLable.frame=CGRectMake(SCREEN_WIDTH-150,75+size.height+5 , 110, 20);
            
            cell.backImage.frame=CGRectMake(10, 2.5, SCREEN_WIDTH-20,70+size.height+20+15);


        }else
        {
            cell.subImage.hidden=NO;
            
            cell.subImage.frame=CGRectMake(70, 75+size.height, SCREEN_WIDTH-110,SCREEN_WIDTH-110);
            
            [cell.subImage setImageWithURL:[NSURL URLWithString:_detailModel.subimage]placeholderImage:[UIImage imageNamed:@"1.jpg"]];
            
            UIView *line=[[UIView alloc]initWithFrame:CGRectMake(5, 80+size.height+SCREEN_WIDTH-110, SCREEN_WIDTH-30, 0.5)];
            
            line.backgroundColor=[UIColor grayColor];
            [cell.backImage addSubview:line];
            
            cell.timeLable.frame=CGRectMake(SCREEN_WIDTH-150, 75+size.height+SCREEN_WIDTH-110+5, 110, 20);
            cell.backImage.frame=CGRectMake(10, 2.5, SCREEN_WIDTH-20, 70+size.height+SCREEN_WIDTH-110+30+5);

        }
        
        NSLog(@"%@",_detailModel.time);
        
        cell.timeLable.text=_detailModel.time;


        return cell;

    }
    
    
    else{
        static NSString *str=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.imageView.image=[UIImage imageNamed:@"head@2x.jpg"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.textLabel.text=@"我是一条评论";
        return cell;

    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else
    {
        return 10;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        UIFont *font = [UIFont systemFontOfSize:16.0];
        CGSize size = CGSizeMake(SCREEN_WIDTH-110, CGFLOAT_MAX);
        NSDictionary *dic = [NSDictionary
                             dictionaryWithObjectsAndKeys:font,
                             NSFontAttributeName,nil];
        size = [_detailModel.info
                boundingRectWithSize:size
                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                attributes:dic context:nil].size;
        if (_detailModel.subimage.length==0) {
            return 70+size.height+20+20;
        }else
        {
            return 75+size.height+SCREEN_WIDTH-110+20+20;
        }
   

    }
    
    return 50;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)sureBtnClick:(id)sender {
}
@end
