//
//  DCMyPictureViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/25.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCMyPictureViewController.h"
#import "DCNavigationViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "DCCell.h"
#import "DCCellModel.h"
#import "DCGroup.h"
#import "DCMycell.h"
@interface DCMyPictureViewController ()

@end

@implementation DCMyPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back" higImageName:nil action:@selector(back) target:self];
    
    [self setupGroup];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCMycell *cell = [DCMycell cellWithTableView:tableView];
    DCGroup *g = self.groupDatas[indexPath.section];
    DCCellModel *cellModel = g.cells[indexPath.row];
    cell.cellModel = cellModel;
    
    [cell setIndexPath:indexPath numberOfRowInSection:g.cells.count];

    return cell;
}

-(void)setupGroup
{
    
    DCGroup *group0 = [[DCGroup alloc]init];
    DCCellModel *cell0 = [DCCellModel cellWithIcon:nil title:@"头像" destVC:nil];

    DCCellModel *cell1 = [DCCellModel cellWithIcon:nil title:@"昵称" destVC:nil];
    cell1.subTitle = @"牵着小狗看夕阳";
    DCCellModel *cell2 = [DCCellModel cellWithIcon:nil title:@"微信号" destVC:nil];
    cell2.subTitle = @"未设置";
    DCCellModel *cell3 = [DCCellModel cellWithIcon:nil title:@"二维码图片" destVC:nil];
    cell3.subTitle = @"跟随系统";
    DCCellModel *cell4 = [DCCellModel cellWithIcon:nil title:@"我的地址" destVC:nil];
    group0.cells = @[cell0,cell1,cell2,cell3,cell4];
    
    
    DCGroup *group1 = [[DCGroup alloc]init];
    DCCellModel *cell5 = [DCCellModel cellWithIcon:nil title:@"性别" destVC:nil];
    cell5.subTitle = @"男";
    DCCellModel *cell6 = [DCCellModel cellWithIcon:nil title:@"地区" destVC:nil];
    cell6.subTitle = @"河南 新乡";
    DCCellModel *cell7 = [DCCellModel cellWithIcon:nil title:@"个性签名" destVC:nil];
    cell7.subTitle = @"跟随系统";
    group1.cells = @[cell5,cell6,cell7];
    
    DCGroup *group2 = [[DCGroup alloc]init];
    DCCellModel *cell8 = [DCCellModel cellWithIcon:nil title:@"Linkedln账号" destVC:nil];
    cell8.subTitle = @"未设置。";
    group2.cells = @[cell8];
    
    [self.groupDatas addObject:group0];
    [self.groupDatas addObject:group1];
    [self.groupDatas addObject:group2];
    
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            return 60;
        }
        else
        {
            return 40;
        }
    }
    else
    {
        return 40;
    }

}

@end
