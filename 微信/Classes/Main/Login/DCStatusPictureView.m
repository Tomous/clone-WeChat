//
//  DCStatusPictureView.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusPictureView.h"
#import "UIImageView+WebCache.h"
#import "DCPhoto.h"

@interface DCStatusPictureView ()

@property(weak, nonatomic) UIImageView *gifView;


@end
@implementation DCStatusPictureView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        
        
        // 创建GIF控件
        UIImageView *gifView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"timeline_image_gif"]];
        [self addSubview:gifView];
        self.gifView = gifView;
        
    }
    return self;
}

-(void)setPhoto:(DCPhoto *)photo
{
    _photo = photo;
    
    // 显示出来，下载
    [self setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];
    
    // 判断是不是GIF
    
    NSString *extensionLower = photo.thumbnail_pic.pathExtension.lowercaseString;
    
    self.gifView.hidden = ![extensionLower isEqualToString:@"gif"];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
}


@end
