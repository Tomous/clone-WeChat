//
//  DCSettingViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/23.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCSettingViewController.h"
#import "DCGroup.h"
#import "DCCellModel.h"
#import "UIBarButtonItem+Extension.h"
#import "DCNewMessageViewController.h"
#import "DCCellSwitchModel.h"
#import "DCCellArrowModel.h"
@interface DCSettingViewController ()

@end

@implementation DCSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"设置";
    [self setupGroup];

}

-(void)setupGroup
{
    
    DCGroup *group0 = [[DCGroup alloc]init];
    DCCellModel *cell0 = [DCCellArrowModel cellWithIcon:nil title:@"账号与安全" destVC:nil];
    group0.cells = @[cell0];
    
    DCGroup *group1 = [[DCGroup alloc]init];
    DCCellModel *cell1 = [DCCellArrowModel cellWithIcon:nil title:@"新消息提醒" destVC:[DCNewMessageViewController class]];
    DCCellModel *cell2 = [DCCellArrowModel cellWithIcon:nil title:@"隐私" destVC:nil];
    DCCellModel *cell3 = [DCCellArrowModel cellWithIcon:nil title:@"通用" destVC:nil];
    group1.cells = @[cell1,cell2,cell3];
    
    DCGroup *group2 = [[DCGroup alloc]init];
    DCCellModel *cell4 = [DCCellArrowModel cellWithIcon:nil title:@"关于微信" destVC:nil];
    group2.cells = @[cell4];
    
    [self.groupDatas addObject:group0];
    [self.groupDatas addObject:group1];
    [self.groupDatas addObject:group2];
    
    
    // 1.创建按钮
    UIButton *logout = [[UIButton alloc] init];
    
    // 2.设置属性
    logout.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [logout setTitle:@"退出当前帐号" forState:UIControlStateNormal];
    [logout setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    logout.titleLabel.backgroundColor = [UIColor clearColor];
    // 3.设置尺寸(tableFooterView和tableHeaderView的宽度跟tableView的宽度一样)
    logout.height = 35;
    
    self.tableView.tableFooterView = logout;


    

}

@end
