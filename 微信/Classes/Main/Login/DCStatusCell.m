//
//  DCStatusCell.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusCell.h"
#import "DCStatusView.h"
#import "DCStatusFrame.h"
#import "DCStatusViewFrame.h"
#import "DCStatusToolBar.h"
@interface DCStatusCell()

@property (weak,nonatomic)DCStatusView *statusView;

@property (weak,nonatomic)DCStatusToolBar *toolBar;

@end
@implementation DCStatusCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *str = @"cell";
    DCStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[DCStatusCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // statusView
        DCStatusView *statusView = [[DCStatusView alloc]init];
        [self.contentView addSubview:statusView];
        self.statusView = statusView;
        
        // toolbar
        DCStatusToolBar *toolBar = [[DCStatusToolBar alloc]init];
        [self.contentView addSubview:toolBar];
        self.toolBar = toolBar;
        
    }
    return self;
}

-(void)setStatusFrame:(DCStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // statusView
    self.statusView.frame = statusFrame.statusViewFrame.frame;
    
    // 传frame给大的view，里面设置小view的frame
    self.statusView.statusViewFrame = statusFrame.statusViewFrame;
    
    // toolbar
    self.toolBar.frame = statusFrame.toolBarFrame;
    self.toolBar.status = statusFrame.status;
}

@end
