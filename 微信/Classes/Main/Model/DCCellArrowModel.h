//
//  DCCellArrowModel.h
//  微信
//
//  Created by 尚承教育 on 15/7/22.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCCellModel.h"

@interface DCCellArrowModel : DCCellModel


-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;

+(instancetype)cellWithIcon:(NSString *)icon title:(NSString *)title destVC:(Class)destVC;
@end
