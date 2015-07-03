//
//  WriteViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/6/18.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "WriteViewController.h"

@interface WriteViewController ()<UITextFieldDelegate>
{
    UITextView *_textView;
    UILabel *_placeHolder;
}

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    // Do any additional setup after loading the view from its nib.
}

-(void)creatUI
{
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(AUTO_MATE_WIDTH(10), AUTO_MATE_HEIGHT(20), AUTO_MATE_WIDTH(300), AUTO_MATE_HEIGHT(240))];
    imgView.backgroundColor=[UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    [imgView.layer setCornerRadius:5];
    imgView.layer.borderColor=[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1].CGColor;
    imgView.layer.borderWidth=1;
    imgView.userInteractionEnabled=YES;
    [self.view addSubview:imgView];

    
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(AUTO_MATE_WIDTH(5), AUTO_MATE_HEIGHT(5), AUTO_MATE_WIDTH(290), AUTO_MATE_HEIGHT(230))];
    _textView.backgroundColor=[UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    _textView.font=[UIFont systemFontOfSize:18];
    _textView.editable=YES;
    _textView.delegate=self;
    _textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [imgView addSubview:_textView];
    
    
    _placeHolder=[[UILabel alloc]initWithFrame:CGRectMake(0, 5, 300, 30)];
    _placeHolder.text= @"说说你的想法";
    _placeHolder.font=[UIFont systemFontOfSize:17];
    _placeHolder.textColor=[UIColor colorWithRed:183/255.0 green:183/255.0 blue:183/255.0 alpha:1];
    [_textView addSubview:_placeHolder];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor orangeColor]];
    btn.frame =CGRectMake(AUTO_MATE_HEIGHT(10), AUTO_MATE_HEIGHT(270), AUTO_MATE_WIDTH(300),30);
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)textViewDidChange:(UITextView *)textView
{
    
    if (_textView.text.length == 0) {
        _placeHolder.text = @" 请留下您的宝贵意见";
    }else{
        _placeHolder.text = @"";
    }
}

#pragma mark - UITextView Delegate Methods
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textView resignFirstResponder];
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
