//
//  DCStatusPicturesView.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCStatusPicturesView : UIView

// 里面是JWPhoto对象
@property (strong, nonatomic) NSArray *pictures;

+(CGSize)sizeWithPicturesCount:(NSUInteger)count;

@end
