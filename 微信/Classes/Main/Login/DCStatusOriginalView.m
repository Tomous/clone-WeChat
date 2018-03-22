//
//  DCStatusOriginalView.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusOriginalView.h"
#import "DCStatusPicturesView.h"
#import "DCStatus.h"
#import "DCUser.h"
#import "DCStatusOriginalFrame.h"
#import "UIImageView+WebCache.h"
@interface DCStatusOriginalView ()

@property(weak, nonatomic) UILabel *nameLabel;
@property(weak, nonatomic) UILabel *textLabel;
@property(weak, nonatomic) UIImageView *iconView;
@property(weak, nonatomic) DCStatusPicturesView *picturesView;

@end
@implementation DCStatusOriginalView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        // neme
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = DCStatusOriginalNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // text
        UILabel *textLabel = [[UILabel alloc]init];
        textLabel.font = DCStatusOriginalTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        // icon
        UIImageView *iconView = [[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        // picturesView
        DCStatusPicturesView *picturesView = [[DCStatusPicturesView alloc]init];
        [self addSubview:picturesView];
        self.picturesView = picturesView;
        
    }
    return self;
}


-(void)setOriginalFrame:(DCStatusOriginalFrame *)originalFrame
{
    _originalFrame = originalFrame;
    
    
    DCStatus *status = originalFrame.status;
    DCUser *user = status.user;
    
    // name
    self.nameLabel.frame = originalFrame.nameFrame;
    self.nameLabel.text = user.name;
    
    // text
    self.textLabel.frame = originalFrame.textFrame;
    self.textLabel.text = status.text;
    
    // icon
    self.iconView.frame = originalFrame.iconFrame;
    [self.iconView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithName:@"avatar_default_small"]];
    
    // picturesView
    self.picturesView.frame = originalFrame.picturesFrame;
    // 图片数组给picturesView，它里面根据数组的个数创建多个pictureView
    self.picturesView.pictures = status.pic_urls;
    
}



@end
