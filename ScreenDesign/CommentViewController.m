//
//  CommentViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/26.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "CommentViewController.h"
#import "Header.h"
@interface CommentViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
}
@end

// cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodShowTableViewCell" owner:self options:nil] lastObject];

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    
//    self.edgesForExtendedLayout=UIRectEdgeNone;

    self.automaticallyAdjustsScrollViewInsets = NO;


    _dataArr=[[NSMutableArray alloc]init];
    
    [self setNavgationBarItemWithTitle:nil imageName:@"btn_left_pressed" action:@selector(back) left:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    //注册一个键盘回收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    _commenttextField.delegate=self;
    
    _myTab.dataSource=self;
    _myTab.delegate=self;
    
    
//    CGRect rect=CGRectMake(_myTab.frame.origin.x, _myTab.frame.origin.y, _myTab.frame.size.width,_myTab.frame.size.height);;
    
    NSLog(@"%f %f %f %f",_myTab.frame.origin.x,_myTab.frame.origin.y, _myTab.frame.size.width,_myTab.frame.size.height);

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    if (_dataArr.count!=0) {
        cell.imageView.image=[UIImage imageNamed:@"head.jpg"];
        cell.textLabel.text=@"我";
        cell.detailTextLabel.text=_dataArr[indexPath.row];
        cell.detailTextLabel.font=[UIFont systemFontOfSize:13];
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_commenttextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSLog(@"%@",textField.text);
    [_dataArr addObject:textField.text];
    [_myTab reloadData];
    
    NSLog(@"%f %f %f %f",_myTab.frame.origin.x,_myTab.frame.origin.y, _myTab.frame.size.width,_myTab.frame.size.height);

    [textField resignFirstResponder];
    return YES;
}

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
