//
//  DCStatusOriginalFrame.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusOriginalFrame.h"
#import "DCStatus.h"
#import "DCUser.h"
#import "DCStatusPicturesView.h"
#import "DCStatusPictureView.h"
@implementation DCStatusOriginalFrame

-(void)setStatus:(DCStatus *)status
{
    _status = status;
    
    // icon
    CGFloat iconX = DCStatusCellMargin;
    CGFloat iconY = DCStatusCellMargin;
    CGFloat iconW = 35;
    CGFloat iconH = iconW;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // name
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + DCStatusCellMargin;
    CGFloat nameY = iconY;
    CGSize nameSize = [status.user.name sizeWithFont:DCStatusOriginalNameFont];
    self.nameFrame = (CGRect){nameX,nameY,nameSize};
    
    // text
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(self.nameFrame) + DCStatusCellMargin;
    CGSize maxSize = CGSizeMake(DCScreenW - 2 * textX, MAXFLOAT);
    CGSize textSize = [status.text sizeWithFont:DCStatusOriginalTextFont constrainedToSize:maxSize];
    self.textFrame = (CGRect){textX,textY,textSize};
    
    // picturesView
    
    CGFloat h = 0 ;
    if (status.pic_urls.count) {
        
        CGFloat picturesViewX = textX;
        CGFloat picturesViewY = CGRectGetMaxY(self.textFrame) + DCStatusCellMargin;
        
        // 根据图片的个数计算picturesView的size
        CGSize picturesSize = [DCStatusPicturesView sizeWithPicturesCount:status.pic_urls.count];
        
        CGFloat picturesViewW = picturesSize.width;
        CGFloat picturesViewH = picturesSize.height;
        
        self.picturesFrame = (CGRect){picturesViewX,picturesViewY,picturesViewW,picturesViewH};
        
        h = CGRectGetMaxY(self.picturesFrame) + DCStatusCellMargin;
    }
    else
    {
        h = CGRectGetMaxY(self.textFrame) + DCStatusCellMargin;
    }
    
    // 自己frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = DCScreenW;
    self.frame = CGRectMake(x, y, w, h);
    
}

@end
