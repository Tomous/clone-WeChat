//
//  DCDiscoverTableViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCDiscoverTableViewController.h"
#import "DCCellModel.h"
#import "DCCell.h"
#import "DCGroup.h"
#import "DCCellArrowModel.h"
#import "DCCellSwitchModel.h"
#import "DCAddNewMessageController.h"
#import "DCFriendsViewController.h"
#import "DCShakeViewController.h"
#import "DCBottleViewController.h"
@interface DCDiscoverTableViewController ()

@end

@implementation DCDiscoverTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGroup];
}


-(void)setupGroup
{
    DCGroup *group0 = [[DCGroup alloc]init];
    [self.groupDatas addObject:group0];
    DCCellModel *cell0 = [DCCellArrowModel cellWithIcon:@"ff_IconShowAlbum" title:@"朋友圈" destVC:[DCFriendsViewController class]];
    group0.cells = @[cell0];

    DCGroup *group1 = [[DCGroup alloc]init];
    [self.groupDatas addObject:group1];
    DCCellModel *cell1 = [DCCellArrowModel cellWithIcon:@"ff_IconQRCode" title:@"扫一扫" destVC:nil];
    DCCellModel *cell2 = [DCCellArrowModel cellWithIcon:@"ff_IconShake" title:@"摇一摇" destVC:[DCShakeViewController class]];
    group1.cells = @[cell1,cell2];

    DCGroup *group2 = [[DCGroup alloc]init];
    [self.groupDatas addObject:group2];
    DCCellModel *cell3 = [DCCellArrowModel cellWithIcon:@"ff_IconLocationService" title:@"附近的人" destVC:nil];
    DCCellModel *cell4 = [DCCellArrowModel cellWithIcon:@"ff_IconBottle" title:@"漂流瓶" destVC:[DCBottleViewController class]];
    group2.cells = @[cell3,cell4];

    DCGroup *group3 = [[DCGroup alloc]init];
    [self.groupDatas addObject:group3];
    DCCellModel *cell5 = [DCCellArrowModel cellWithIcon:@"CreditCard_ShoppingBag" title:@"购物" destVC:nil];
    DCCellModel *cell6 = [DCCellArrowModel cellWithIcon:@"MoreGame" title:@"游戏" destVC:nil];
    group3.cells = @[cell5,cell6];
    
}
@end
