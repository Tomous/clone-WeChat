//
//  DCComposePhotoView.m
//  微信
//
//  Created by 尚承教育 on 15/8/5.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCComposePhotoView.h"

@implementation DCComposePhotoView

-(void)addImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc]init];
    
    imageView.image = image;
    
    [self addSubview:imageView];
}

-(NSArray *)images
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:self.subviews.count];
    
    for (UIImageView *imageView in self.subviews) {
        
        [tempArray addObject:imageView.image];
    }
    return tempArray;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    // 总列数
    int totalCol = 4;
    CGFloat margin = 10;
    
    CGFloat imageW = (self.width - (totalCol + 1) * margin) / totalCol;
    CGFloat imageH = imageW;
    
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = (UIImageView *)self.subviews[i];
        imageView.width = imageW;
        imageView.height = imageH;
        
        // 列号
        int col = i % totalCol;
        
        // 行号
        int row = i / totalCol;
        
        imageView.x = margin + col * (margin + imageW);
        imageView.y = margin + row * (margin + imageH);
    }

}
@end
