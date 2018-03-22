//
//  DCCell.m
//  微信
//
//  Created by 尚承教育 on 15/7/22.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCCell.h"
#import "DCCellArrowModel.h"
#import "DCCellSwitchModel.h"
#import "DCCellModel.h"
@interface DCCell ()

@property(strong,nonatomic)UIImageView *arrowView;
@property(strong,nonatomic)UISwitch *switchView;

@end
@implementation DCCell

-(UIImageView *)arrowView
{
    if (!_arrowView) {
        _arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"TableViewArrow"]];
    }
    return _arrowView;
}

-(UISwitch *)switchView
{
    if (!_switchView) {
        
        _switchView = [[UISwitch alloc]init];
        
        // 监听switch值的改变
        [self.switchView addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

-(void)switchValueChange:(UISwitch *)switchView
{
    // 保存switch的值
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:switchView.isOn forKey:self.cellModel.title];
    
    // 立即保存起来
    [ud synchronize];
    
}


+(instancetype)cellWithTableView:(UITableView *)tableView
{

    static NSString *str = @"cell";
    DCCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        
        cell = [[DCCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 设置标题的字体
        self.textLabel.font = [UIFont boldSystemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
        
        self.backgroundColor = [UIColor clearColor];

        // 创建cell的背景imageView
        self.backgroundView = [[UIImageView alloc]init];
        self.selectedBackgroundView = [[UIImageView alloc]init];
        

    }
    return self;
}

-(void)setCellModel:(DCCellModel *)cellModel
{
    _cellModel = cellModel;
    
    // 给子控件赋值
    self.imageView.image = [UIImage imageNamed:cellModel.icon];
    self.textLabel.text = cellModel.title;
    
    //label最下面的字体
    self.detailTextLabel.text = cellModel.subTitle;
    self.detailTextLabel.numberOfLines = 0;
    
    if ([cellModel isKindOfClass:[DCCellArrowModel class]]) {
        self.accessoryView = self.arrowView;
    }
    else if ([cellModel isKindOfClass:[DCCellSwitchModel class]])
    {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryView = self.switchView;
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        [self.switchView setOn:[ud boolForKey:self.cellModel.title]];
    }
}

-(void)setIndexPath:(NSIndexPath *)indexPath numberOfRowInSection:(NSInteger)rowsCount
{
    UIImageView *bg = (UIImageView *)self.backgroundView;
    UIImageView *selBg = (UIImageView *)self.selectedBackgroundView;
    
    if (rowsCount == 1) {
        bg.image = [UIImage resizableImage:@"common_card_background"];
        selBg.image = [UIImage resizableImage:@"common_card_background_highlighted"];
    }
    else if (indexPath.row == 0)
    {
        bg.image = [UIImage resizableImage:@"common_card_top_background"];
        selBg.image = [UIImage resizableImage:@"common_card_top_background_highlighted"];
    }
    else if (indexPath.row == rowsCount - 1)
    {
        bg.image = [UIImage resizableImage:@"common_card_bottom_background"];
        selBg.image = [UIImage resizableImage:@"common_card_bottom_background_highlighted"];
    }
    else   // 中间
    {
        bg.image = [UIImage resizableImage:@"common_card_middle_background"];
        selBg.image = [UIImage resizableImage:@"common_card_middle_background_highlighted"];
    }

}
@end
