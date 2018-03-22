//
//  DCCell.h
//  微信
//
//  Created by 尚承教育 on 15/7/22.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DCCellModel.h"
@interface DCCell : UITableViewCell

-(void)setIndexPath:(NSIndexPath *)indexPath numberOfRowInSection:(NSInteger)rowsCount;

@property(strong,nonatomic)DCCellModel *cellModel;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
