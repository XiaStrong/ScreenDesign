//
//  FoodsViewController.h
//  ScreenDesign
//
//  Created by 夏强 on 15/6/15.
//  Copyright (c) 2015年 夏强. All rights reserved.
//

#import "RootViewController.h"
#import "FoodCollectionViewCell.h"
@interface FoodsViewController : RootViewController

@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;

@end
