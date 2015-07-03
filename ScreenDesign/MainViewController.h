//
//  MainViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/5/22.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "RootViewController.h"

@interface MainViewController : RootViewController
@property (weak, nonatomic) IBOutlet UITableView *queationTabView;

@property (nonatomic,strong)UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextField *tf;

@end
