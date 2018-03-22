//
//  DCPopView.h
//  微信
//
//  Created by 尚承教育 on 15/7/22.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    DCPopViewArrowPositionLeft,
    DCPopViewArrowPositionRight,
    DCPopViewArrowPositionRenter
    
}DCPopViewArrowPosition;


@class DCPopView;

@protocol DCPopViewDelegate <NSObject>

-(void)popViewDidClickCover:(DCPopView *)popView;

@end



@interface DCPopView : UIView

@property(assign,nonatomic)BOOL dimBackgroud;

@property(assign,nonatomic)DCPopViewArrowPosition arrowPosition;
@property (weak,nonatomic)id<DCPopViewDelegate>delegate;

-(instancetype)initWithContentView:(UIView *)contentView;

+(instancetype)popViewWithContentView:(UIView *)contentView;

-(void)showInRect:(CGRect)rect;

@end
