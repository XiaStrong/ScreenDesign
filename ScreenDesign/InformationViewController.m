//
//  InformationViewController.m
//  ScreenDesign
//
//  Created by 夏强 on 15/5/28.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "InformationViewController.h"
#import "InformationUpTableViewCell.h"
#import "CityViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface InformationViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZHPickViewDelegate,CityViewControllerDelegate>
{
    NSMutableDictionary *_MyDict;
}

@end

@implementation InformationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title=@"个人信息";
    
    _MyDict = [[NSMutableDictionary alloc] init];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    写数据到userDefaults
//    只是写到内存
    
    [userDefaults setObject:_MyDict forKey:@"_MyDict"];
    
    //写到plist文件
    [userDefaults synchronize];
    
    _InformationTabView.delegate=self;
    _InformationTabView.dataSource=self;
    [self.view addSubview:_InformationTabView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else
    {
        return 4;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 50;
    }
    else
    {
        return 45;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSMutableDictionary *dict=[userDefaults objectForKey:@"_MyDict"];
    
    NSArray *titleArr=@[@"本人性别",@"宝宝性别",@"宝宝生日",@"所在地区"];
    NSLog(@"%@",dict);
    
    if (indexPath.section==0) {
        static NSString *str0=@"cell0";
        InformationUpTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str0];
        if (cell==nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"InformationUpTableViewCell" owner:self options:nil] lastObject];
        }
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        //取数据
        NSData *imageData = [userDefaults objectForKey:@"headImage"];
        
        cell.headImageView.image=[UIImage imageWithData:imageData];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;

        return cell;
    }

    else{
        static NSString *str2=@"cell2";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str2];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str2];
        }
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        NSString *str=titleArr[indexPath.row];
        cell.textLabel.text=str;

        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@" ,[dict objectForKey:str]];

        return cell;

    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0&&indexPath.row==0) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择",nil];
        sheet.tag=100;
        [sheet showInView:self.view];

    }
    
    if (indexPath.section==1&&indexPath.row==0) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"本人性别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女",nil];
        sheet.tag=101;
        [sheet showInView:self.view];

    }
    
    if (indexPath.section==1&&indexPath.row==1) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"宝宝性别" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"小王子",@"小公主",nil];
        sheet.tag=102;
        [sheet showInView:self.view];
    }
    
    if (indexPath.section==1&&indexPath.row==2) {
        [_pickview remove];
        NSDate *date=[NSDate dateWithTimeIntervalSinceNow:0];
        _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
        _pickview.delegate=self;
        [_pickview show];
    }
    if (indexPath.section==1&&indexPath.row==3) {
        CityViewController *cvc=[[CityViewController alloc]init];
        cvc.delegate=self;
        [self.navigationController pushViewController:cvc animated:YES];

    }

}

-(void)getCityData:(NSString *)city
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [_MyDict setObject:city forKey:@"所在地区"];
    [userDefaults setObject:_MyDict forKey:@"_MyDict"];
    [userDefaults synchronize];
    [_InformationTabView reloadData];

}


#pragma mark ZhpickVIewDelegate 宝宝时间的设置lable

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [_MyDict setObject:resultString forKey:@"宝宝生日"];

    [userDefaults setObject:_MyDict forKey:@"_MyDict"];
    [userDefaults synchronize];

    
    [_InformationTabView reloadData];
    
    
}




- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    if (actionSheet.tag==100) {
        if(buttonIndex == 0) {
            //拍照
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                //如果是UIImagePickerControllerSourceTypeCamera 证明是拍照
                [self loadImageWithSourceType:UIImagePickerControllerSourceTypeCamera];
            } else {
                UIAlertView *aleart = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂不支持拍照" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [aleart show];
            }
            
            
        } else if(buttonIndex == 1)
        {
            //取本地相册,判断支不支持读取本地相册
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                //可以调取本地相册
                [self loadImageWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            } else {
                
                UIAlertView *aleart = [[UIAlertView alloc] initWithTitle:@"提示" message:@"暂不支持读取本地相册" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [aleart show];
            }
        }

    }
    
    if(actionSheet.tag==101){
        
        if (buttonIndex==0) {
            [_MyDict setObject:@"男" forKey:@"本人性别"];
            
        }else
        {
            [_MyDict setObject:@"女" forKey:@"本人性别"];
        }
        [userDefaults setObject:_MyDict forKey:@"_MyDict"];
        [userDefaults synchronize];
        [_InformationTabView reloadData];
    }
    if(actionSheet.tag==102)
    {
        if (buttonIndex==0) {
            [_MyDict setObject:@"小王子" forKey:@"宝宝性别"];
            
        }else
        {
            [_MyDict setObject:@"小公主" forKey:@"宝宝性别"];
        }
        [userDefaults setObject:_MyDict forKey:@"_MyDict"];
        [userDefaults synchronize];
        [_InformationTabView reloadData];

    }
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    //相册里面 会存在很多种资源 最起码会有图片和视频 所以根据不同的资源我们有不同的操作
    
    NSLog(@" info %@ ",info);
    
    NSString *sourceType = [info objectForKey:UIImagePickerControllerMediaType];
    
    //判断是不是图片
    if([sourceType isEqualToString:(NSString *)kUTTypeImage]) {
        //取到这张图片
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        NSData *imageData = UIImagePNGRepresentation(image);

        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        //写数据到userDefaults
        //只是写到内存
        
        [userDefaults setObject:imageData forKey:@"headImage"];
        //写到plist文件
        [userDefaults synchronize];

        
        
        
//        NSLog(@"%@",image);
//        
//        CGSize newSize = CGSizeMake(100, 100);//（需要裁剪的size大小）
//        UIGraphicsBeginImageContext(newSize);
//        [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        NSLog(@"newimage%@",newImage);
        
        
        
        //将图片转化为png格式的NSData
//        NSData *imageData = UIImagePNGRepresentation(newImage);
        
        
//        NSLog(@"imageData---------%@",imageData);
        
        
    }
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        [_InformationTabView reloadData];
    }];
    
}


- (void)loadImageWithSourceType:(UIImagePickerControllerSourceType)type
{
    //根据不同的资源类型加载不同的界面
    UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
    //设置delegate
    pickVC.delegate = self;
    //资源类型
    pickVC.sourceType = type;
    
    //允许编辑
    pickVC.allowsEditing = YES;
    
    [self presentViewController:pickVC animated:YES completion:^{
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
