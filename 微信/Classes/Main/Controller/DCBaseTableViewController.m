//
//  DCBaseTableViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCBaseTableViewController.h"
#import "DCCellModel.h"
#import "DCGroup.h"
#import "DCCell.h"
#import "DCCellArrowModel.h"

@interface DCBaseTableViewController ()

@property(strong,nonatomic)NSMutableArray *groupDatas;

@end

@implementation DCBaseTableViewController

-(NSMutableArray *)groupDatas
{
    if (!_groupDatas) {
        _groupDatas = [NSMutableArray array];
    }
    return _groupDatas;
}

-(instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.tabBarController.viewControllers.count > 0) {
        self.tabBarController.hidesBottomBarWhenPushed = YES;
    }

//    self.tableView.rowHeight = 60;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupDatas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    DCGroup *g = self.groupDatas[section];
    return g.cells.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCCell *cell = [DCCell cellWithTableView:tableView];
    DCGroup *g = self.groupDatas[indexPath.section];
    DCCellModel *cellModel = g.cells[indexPath.row];
    cell.cellModel = cellModel;
    
    [cell setIndexPath:indexPath numberOfRowInSection:g.cells.count];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    DCGroup *g = self.groupDatas[section];
    return g.header;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    DCGroup *g = self.groupDatas[section];
    return g.footer;
}

// 点击每一个cell 都会来到这里
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中哪一行
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DCGroup *g = self.groupDatas[indexPath.section];
    DCCellModel *cell = g.cells[indexPath.row];
    
    // 如果是检查版本更新  弹框  一段代码 block
    
//    if([cell isKindOfClass:[DCCellArrowModel class]]) {
    
//        DCCellArrowModel *arrowItem = (DCCellArrowModel *)cell;
    
        UIViewController *destVC = [[cell.destVC alloc]init];
        
        [self.navigationController pushViewController:destVC animated:YES];
//    }

    
}



@end
