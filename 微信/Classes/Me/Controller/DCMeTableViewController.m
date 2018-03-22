//
//  DCMeTableViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCMeTableViewController.h"
#import "DCGroup.h"
#import "DCCell.h"
#import "DCCellModel.h"
#import "DCCellSwitchModel.h"
#import "DCCellArrowModel.h"
#import "DCSettingViewController.h"
#import "DCMyPictureViewController.h"
#import "DCNavigationViewController.h"
#import "DCFriendsViewController.h"
#import "DCPurseViewController.h"
@interface DCMeTableViewController ()

@property(strong,nonatomic)NSMutableArray *groupDatas;
@end

@implementation DCMeTableViewController

-(NSMutableArray *)groupDatas
{
    if (!_groupDatas) {
        
        _groupDatas = [NSMutableArray array];
    }
    return _groupDatas;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 每组之间的间距
    self.tableView.sectionHeaderHeight = 0.5;
    
    [self setupGroups];
    [self setupHeaderView];
}

-(void)setupHeaderView
{
    
}
-(void)clickImageBtn:(UIButton *)btn
{
    DCMyPictureViewController *VC = [[DCMyPictureViewController alloc]init];
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:VC];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
}
-(void)setupGroups
{
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
}

-(void)setupGroup0
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 100)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, self.view.width, 100)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(clickImageBtn:) forControlEvents:UIControlEventTouchDown];
    [headerView addSubview:btn];
//    self.tableView.tableHeaderView = btn;
    
    CGFloat margin = 10;
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beauty"]];
    imageView1.x = margin;
    imageView1.y = margin;
    imageView1.height = btn.height - margin *2;
    imageView1.width = imageView1.height;
    [btn addSubview:imageView1];
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"牵着小狗看夕阳";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.x = CGRectGetMaxX(imageView1.frame) + margin;
    nameLabel.y = imageView1.height /2;
    nameLabel.width = 200;
    nameLabel.height = 30;
    [btn addSubview:nameLabel];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"setting_myQR"]];
    imageView2.height = 30;
    imageView2.width = imageView2.height;
    imageView2.x = btn.width - (margin *2 + imageView2.width);
//    imageView2.y = (btn.height - imageView2.height) / 2;
    imageView2.y = nameLabel.y;
    [btn addSubview:imageView2];

}
-(void)setupGroup1
{
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    DCCellModel *cell0 = [DCCellArrowModel cellWithIcon:@"MoreMyAlbum" title:@"相册" destVC:[DCFriendsViewController class]];
    DCCellModel *cell1 = [DCCellArrowModel cellWithIcon:@"MoreMyFavorites" title:@"收藏" destVC:nil];
    DCCellModel *cell2 = [DCCellArrowModel cellWithIcon:@"MoreMyBankCard" title:@"钱包" destVC:[DCPurseViewController class]];
    
    group.cells = @[cell0,cell1,cell2];
}

-(void)setupGroup2
{
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    DCCellModel *cell0 = [DCCellArrowModel cellWithIcon:@"MoreAmotion" title:@"表情" destVC:nil];
    group.cells = @[cell0];
}

-(void)setupGroup3
{
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    
    DCCellModel *cell0 = [DCCellArrowModel cellWithIcon:@"MoreSetting" title:@"设置" destVC:[DCSettingViewController class]];
    
    group.cells = @[cell0];
    
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
//            
//            return 100;
//        }
//
//            return 60;
//    }
//    else
//    {
//        return 60;
//    }
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 40;
    }
    else
    {
        return 0;
    }
}

@end
