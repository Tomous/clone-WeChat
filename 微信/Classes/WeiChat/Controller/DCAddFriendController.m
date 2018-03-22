//
//  DCAddFriendController.m
//  微信
//
//  Created by 尚承教育 on 15/7/23.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCAddFriendController.h"
#import "DCGroup.h"
#import "DCCellModel.h"
#import "UIBarButtonItem+Extension.h"
#import "DCCellArrowModel.h"
#import "DCSeachBar.h"
#import "DCRedarAddFriendController.h"
@interface DCAddFriendController ()<UISearchBarDelegate>

@property(strong,nonatomic)UIView *cover;
@property(strong,nonatomic)UISearchBar *searchBar;

@end

@implementation DCAddFriendController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroup];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back" higImageName:nil action:@selector(back) target:self];
    
    [self setupHeaderView];
    

}

-(void)setupHeaderView
{
    
    //    self.tableView.sectionHeaderHeight = 0.5;
    
    UIView *hearderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.size.width, 100)];
    hearderView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = hearderView;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 5, hearderView.width, hearderView.height / 2)];
    [btn setImage:[UIImage imageWithName:@"add_friend_searchicon"] forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -160, 0, 0)];
    [btn setTitle:[NSString stringWithFormat:@"微信号/QQ号/手机号"] forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -150, 0, 0)];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(searchBarClick) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat textX = 0;
    CGFloat textH = 20;
    CGFloat textY = btn.height + 10;
    UILabel *texLabel = [[UILabel alloc]initWithFrame:CGRectMake(textX, textY, btn.width, textH)];
    texLabel.text = @"我的手机号是： 74110";
    texLabel.textAlignment = NSTextAlignmentCenter;
    texLabel.textColor = [UIColor lightGrayColor];
    [btn addSubview:texLabel];
    
    CGFloat btnW = 40;
    CGFloat btnH = btnW;
    CGFloat btnX = btn.width - btnW - 60;
    CGFloat btnY = CGRectGetMaxY(btn.frame);
    UIButton *imgBtn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [imgBtn setImage:[UIImage imageWithName:@"setting_myQR"] forState:UIControlStateNormal];
    [imgBtn addTarget:self action:@selector(imgBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [hearderView addSubview:imgBtn];
    [hearderView addSubview:btn];
    
}

-(void)searchBarClick
{
    UIView *cover = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor greenColor];
    self.cover = cover;
    [self.view addSubview:cover];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back" higImageName:nil action:@selector(backd) target:self];
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 5, self.view.size.width, 30)];
    self.searchBar = searchBar;
    searchBar.showsCancelButton = YES;
    [cover addSubview:searchBar];
    
}
-(void)backd
{
    [self.cover removeFromSuperview];
}

-(void)imgBtnClick
{
    NSLog(@"++++++++");
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupGroup
{
    
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    
    DCCellModel *cell0 = [DCCellArrowModel cellWithIcon:@"add_friend_icon_reda" title:@"雷达加朋友" destVC:[DCRedarAddFriendController class]];
    cell0.subTitle = @"添加身边的朋友";
    DCCellModel *cell1 = [DCCellArrowModel cellWithIcon:@"add_friend_icon_addgroup" title:@"面对面群聊" destVC:nil];
    cell1.subTitle = @"与身边的朋友进入同一个群聊";
    DCCellModel *cell2 = [DCCellArrowModel cellWithIcon:@"add_friend_icon_scanqr" title:@"扫一扫" destVC:nil];
    cell2.subTitle = @"扫描二维码名片";
    DCCellModel *cell3 = [DCCellArrowModel cellWithIcon:@"plugins_FriendNotify" title:@"QQ/Linkedln/手机联系人" destVC:nil];
    cell3.subTitle = @"添加或邀请通讯录中的朋友";
    DCCellModel *cell4 = [DCCellArrowModel cellWithIcon:@"CreditCard_Audit" title:@"公众号" destVC:nil];
    cell4.subTitle = @"获取更多资讯和服务";

    group.cells = @[cell0,cell1,cell2,cell3,cell4];

}


@end
