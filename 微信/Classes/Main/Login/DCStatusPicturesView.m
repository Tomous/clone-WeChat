//
//  DCStatusPicturesView.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusPicturesView.h"

#import "DCStatusPictureView.h"
#import "DCPhoto.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"

#define kPicutreW 70
#define kPicutreH kPicutreW

#define kStatusPicMaxCount 9
#define kStatusPicMargin 10

// 最大列数 3   4张图片的时候为2
#define kStatusPicMaxCol(picutureCount) ((picutureCount == 4) ? 2 : 3)

@interface DCStatusPicturesView ()

@property(weak, nonatomic) UIImageView *imageView;

@property(assign, nonatomic) CGRect lastFrame;

@end


@implementation DCStatusPicturesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        // 预先创建9个JWStatusPictureView
        for (int i = 0; i < kStatusPicMaxCount; i++)
        {
            DCStatusPictureView *pictureView = [[DCStatusPictureView alloc]init];
            pictureView.tag = i;
            [self addSubview:pictureView];
            
            
            // 一个手势对应一个view
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImageView:)];
            [pictureView addGestureRecognizer:recognizer];
        }
        
    }
    return self;
}

-(void)clickImageView:(UITapGestureRecognizer *)gesRecognizer
{
   
    
    // 创建图片浏览器
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc]init];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    
    for (int i = 0; i < self.pictures.count; i++) {
        DCPhoto *picture = self.pictures[i];
        
        MJPhoto *photo = [[MJPhoto alloc]init];
        
        // 图片的路径
        photo.url = [NSURL URLWithString:picture.bmiddle_pic];
        
        // 指定来自哪个小View，之后回到指定的View
        photo.srcImageView = self.subviews[i];
        
        [tempArr addObject:photo];
    }
    
    browser.currentPhotoIndex = gesRecognizer.view.tag;
    
    // 给浏览器设置要显示的图片数组
    browser.photos = tempArr;
    
    // 显示
    [browser show];
    
    
}



-(void)setPictures:(NSArray *)pictures
{
    _pictures = pictures;
    
    for (int i = 0; i < kStatusPicMaxCount; i++) {
        DCStatusPictureView *pictureView = self.subviews[i];
        
        
        if (i >= pictures.count) {
            pictureView.hidden = YES;
        }
        else
        {
            // 给小view图片对象JWPhoto
            pictureView.photo = pictures[i];
            
            pictureView.hidden = NO;
        }
        
    }
    
}

// 根据图片的个数就算大的（红色）view的尺寸
+(CGSize)sizeWithPicturesCount:(NSUInteger)count
{
    
    // 最大列数
    NSUInteger maxCols = kStatusPicMaxCol(count);
    
    // 总行数   总数  一行显示3个  显示多少行
    NSUInteger totalRows = (count + maxCols - 1) / maxCols;
    // 总列数   1
    NSInteger totalCols = count >= maxCols ? maxCols : count;
    
    CGFloat picturesViewW = kPicutreW * totalCols + (totalCols - 1) * kStatusPicMargin;
    CGFloat picturesViewH = kPicutreH * totalRows + (totalRows - 1) * kStatusPicMargin;
    return CGSizeMake(picturesViewW, picturesViewH);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i < self.subviews.count; i++) {
        
        DCStatusPictureView *pictureView = self.subviews[i];
        
        // 设置frame
        pictureView.width = kPicutreW;
        pictureView.height = kPicutreH;
        
        // 列号
        int col = i % kStatusPicMaxCol(self.pictures.count);
        // 行号
        int row = i / kStatusPicMaxCol(self.pictures.count);
        
        pictureView.x = col * (pictureView.width + kStatusPicMargin);
        pictureView.y = row * (pictureView.height + kStatusPicMargin);
        
    }
}

@end
