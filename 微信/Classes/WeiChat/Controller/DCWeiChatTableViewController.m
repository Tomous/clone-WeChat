//
//  DCWeiChatTableViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/20.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//


#import "DCWeiChatTableViewController.h"
#import "DCPopView.h"
#import "DCCellModel.h"
#import "UIImage+Extension.h"
#import "DCAddNewMessageController.h"
#import "DCNavigationViewController.h"
#import "DCAddFriendController.h"
#import "DCSeachBar.h"
@interface DCWeiChatTableViewController ()<DCPopViewDelegate,UISearchBarDelegate,UIGestureRecognizerDelegate>

@property(strong,nonatomic)UIButton *voiceBtn;
@property(strong,nonatomic)UIView *searchView;
@property(strong,nonatomic)DCPopView *homePopView;

@property(strong,nonatomic)UIView *popView;

@end

@implementation DCWeiChatTableViewController

-(UIView *)popView
{
    if (!_popView) {
        _popView = [[UIView alloc]init];
        
        [self setbtn];
    }
    return _popView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupRightNav];
    
    [self setupSearchBar];
    
}

-(void)setbtn
{
    CGFloat margin = 5;
    UIButton *btn1 = [[UIButton alloc]init];
    btn1.x = margin;
    btn1.y = margin;
    btn1.width = 100;
    btn1.height = 50;
    [btn1 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [btn1 setImage:[UIImage imageNamed:@"contacts_add_newmessage"] forState:UIControlStateNormal];
    [btn1 setTitle:@"发起群聊" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(addNewmessage:) forControlEvents:UIControlEventTouchDown];
    [_popView addSubview:btn1];
    
    
    UIButton *btn2 = [[UIButton alloc]init];
    btn2.x = margin;
    btn2.y = CGRectGetMaxY(btn1.frame) + margin;
    btn2.width = 100;
    btn2.height = 50;
    [btn2 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 15)];
    [btn2 setImage:[UIImage imageNamed:@"contacts_add_friend"] forState:UIControlStateNormal];
    [btn2 setTitle:@"添加朋友" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(addFriend) forControlEvents:UIControlEventTouchDown];
    [_popView addSubview:btn2];

    UIButton *btn3 = [[UIButton alloc]init];
    btn3.x = margin;
    btn3.y = CGRectGetMaxY(btn2.frame) + margin;
    btn3.width = 100;
    btn3.height = 50;
    [btn3 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [btn3 setImage:[UIImage imageNamed:@"contacts_add_scan"] forState:UIControlStateNormal];
    [btn3 setTitle:@"扫一扫" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(addScan) forControlEvents:UIControlEventTouchDown];
    
    [_popView addSubview:btn3];


}

-(void)addNewmessage:(UITableViewController *)VC
{
    
    DCAddNewMessageController *addMesVC = [[DCAddNewMessageController alloc]init];
    
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:addMesVC];

    nav.modalPresentationStyle = UIModalPresentationCustom;

    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
    
    [self.homePopView removeFromSuperview];
    
}


-(void)addFriend
{
    
    DCAddFriendController *addFriendVC = [[DCAddFriendController alloc]init];
    
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:addFriendVC];
    
    nav.modalPresentationStyle = UIModalPresentationCustom;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
    
    [self.homePopView removeFromSuperview];

}

-(void)addScan
{
    NSLog(@"-----addScan");
}


-(void)setupRightNav
{
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"barbuttonicon_add" higImageName:nil action:@selector(plusClickBtn:) target:self];

}
-(void)setupSearchBar
{
    DCSeachBar *searchBar = [[DCSeachBar alloc]initWithFrame:CGRectMake(0, 5, self.view.size.width, 30)];
    [self.view addSubview:searchBar];
    
}

-(void)plusClickBtn:(UIButton *)button
{
    NSLog(@"-------plusClick");

    // 弹出菜单
    DCPopView *popView = [DCPopView popViewWithContentView:self.popView];
    
    self.homePopView = popView;
    // 设置灰色背景
    popView.dimBackgroud = YES;
    
    popView.arrowPosition = DCPopViewArrowPositionRight;
    
    popView.delegate = self;
    
    [popView showInRect:CGRectMake(150, 60, 140,180)];
    
}

-(void)voiceBtnClick:(UIButton *)btn
{
    NSLog(@"--------%@",btn);
}


@end
