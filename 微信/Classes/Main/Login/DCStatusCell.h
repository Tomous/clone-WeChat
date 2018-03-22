//
//  DCStatusCell.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCStatusFrame;
@interface DCStatusCell : UITableViewCell

@property (strong, nonatomic) DCStatusFrame *statusFrame;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
