//
//  DCAddNewMessageController.m
//  微信
//
//  Created by 尚承教育 on 15/7/23.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCAddNewMessageController.h"
#import "DCGroup.h"
#import "DCCellModel.h"
#import "UIBarButtonItem+Extension.h"
@interface DCAddNewMessageController ()

@end

@implementation DCAddNewMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroup];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"navigationbar_back" higImageName:nil action:@selector(back) target:self];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(queding)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor greenColor];
}

-(void)queding
{
    NSLog(@"---------------");
}
-(void)back
{
   [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)setupGroup
{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 5, self.view.size.width, 30)];
    [self.view addSubview:searchBar];
    
    DCGroup *group = [[DCGroup alloc]init];
    [self.groupDatas addObject:group];
    
    DCCellModel *cell0 = [DCCellModel cellWithIcon:nil title:@"选择一个群" destVC:nil];
    DCCellModel *cell1 = [DCCellModel cellWithIcon:nil title:@"面对面群聊" destVC:nil];
    
    group.cells = @[cell0,cell1];
}

@end
