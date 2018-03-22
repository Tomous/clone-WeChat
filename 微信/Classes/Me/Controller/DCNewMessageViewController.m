//
//  DCNewMessageViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/24.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCNewMessageViewController.h"
#import "DCMycell.h"
#import "DCCellModel.h"
#import "DCGroup.h"
#import "DCCellSwitchModel.h"
#import "DCCellArrowModel.h"
@interface DCNewMessageViewController ()

@end

@implementation DCNewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新消息提醒";
    [self setupGroup];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCMycell *cell = [DCMycell cellWithTableView:tableView];
    DCGroup *g = self.groupDatas[indexPath.section];
    DCCellModel *cellModel = g.cells[indexPath.row];
    cell.cellModel = cellModel;
    return cell;
}

-(void)setupGroup
{
    
    DCGroup *group0 = [[DCGroup alloc]init];
    DCCellModel *cell0 = [DCCellModel cellWithIcon:nil title:@"接收新消息通知" destVC:nil];
    cell0.subTitle = @"已开启";
    group0.footer = @" 如果你要关闭或开启违心的新消息通知，请在iPhone的“设置”-“通知”功能中，找到应用程序“微信”更改。";
    group0.cells = @[cell0];
    
    DCGroup *group1 = [[DCGroup alloc]init];
    DCCellModel *cell1 = [DCCellSwitchModel cellWithIcon:nil title:@"通知显示新消息详情" destVC:nil];
    group1.footer = @"若关闭，当收到微信消息时，通知提示将不显示发信人和内容摘要。";
    group1.cells = @[cell1];

    DCGroup *group2 = [[DCGroup alloc]init];
    DCCellModel *cell2 = [DCCellArrowModel cellWithIcon:nil title:@"功能消息免打扰" destVC:nil];
    group2.footer = @"设置系统功能消息提示声音和振动的时段。";
    group2.cells = @[cell2];

    DCGroup *group3 = [[DCGroup alloc]init];
    DCCellModel *cell3 = [DCCellSwitchModel cellWithIcon:nil title:@"声音" destVC:nil];
    DCCellModel *cell4 = [DCCellSwitchModel cellWithIcon:nil title:@"振动" destVC:nil];
    group3.footer = @"当微信在运行时，你可以设置是否需要声音或者振动。";
    group3.cells = @[cell3,cell4];

    DCGroup *group4 = [[DCGroup alloc]init];
    DCCellModel *cell5 = [DCCellSwitchModel cellWithIcon:nil title:@"朋友圈照片更新" destVC:nil];
    group4.footer = @"关闭后，有朋友更新照片时，界面下面的“发现”切换按钮上不再出现红点提示。";
    group4.cells = @[cell5];
    
    [self.groupDatas addObject:group0];
    [self.groupDatas addObject:group1];
    [self.groupDatas addObject:group2];
    [self.groupDatas addObject:group3];
    [self.groupDatas addObject:group4];

    
}

@end
