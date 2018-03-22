//
//  DCChatListTableViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCChatListTableViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "DCGroup.h"
#import "DCCell.h"
#import "DCCellModel.h"
#import "DCSeachBar.h"
#import "DCNavigationViewController.h"
#import "DCAddFriendController.h"
#import "DCAddNewMessageController.h"
@interface DCChatListTableViewController ()<UISearchBarDelegate>

@property(strong,nonatomic)UIButton *voiceBtn;
@property(strong,nonatomic)UISearchBar *searchBar;
@property(strong,nonatomic)UIView *searchView;

@end

@implementation DCChatListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"contacts_add_friend" higImageName:nil action:@selector(addFriends) target:self];
    
    [self setupSearchBar];
    
    [self setupGroup];
}

-(void)setupGroup
{
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    
    DCCellModel *cell0 = [DCCellModel cellWithIcon:@"plugins_FriendNotify" title:@"新的朋友" destVC:nil];
    DCCellModel *cell1 = [DCCellModel cellWithIcon:@"add_friend_icon_addgroup" title:@"群聊" destVC:nil];
    DCCellModel *cell2 = [DCCellModel cellWithIcon:@"Contact_icon_ContactTag" title:@"标签" destVC:nil];
    DCCellModel *cell3 = [DCCellModel cellWithIcon:@"add_friend_icon_offical" title:@"公众号" destVC:nil];
    group.cells = @[cell0,cell1,cell2,cell3];
}
-(void)addFriends
{
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:[[DCAddFriendController alloc]init]];
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)setupSearchBar
{
    DCSeachBar *searchBar = [[DCSeachBar alloc]initWithFrame:CGRectMake(0, 5, self.view.size.width, 30)];
    [self.view addSubview:searchBar];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.tableView removeFromSuperview];
}
@end
