//
//  DCStatusDetailViewFrame.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusDetailViewFrame.h"
#import "DCStatus.h"
#import "DCUser.h"
#import "DCStatusPicturesView.h"
@implementation DCStatusDetailViewFrame

-(void)setRetweeted_status:(DCStatus *)retweeted_status
{
    _retweeted_status = retweeted_status;
    
    // name
    CGFloat nameX = DCStatusCellMargin *2 +35;
    CGFloat nameY = DCStatusCellMargin;
    
    NSString *name = [NSString stringWithFormat:@"@%@",retweeted_status.user.name];
    CGSize nameSize = [name sizeWithFont:DCStatusRetweetedNameFont];
    self.nameFrame = (CGRect){nameX,nameY,nameSize};
    
    // text
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(self.nameFrame) + DCStatusCellMargin * 0.5;
    CGSize maxSize = CGSizeMake(DCScreenW - 2 * textX, MAXFLOAT);
    CGSize textSize = [retweeted_status.text sizeWithFont:DCStatusRetweetedTextFont constrainedToSize:maxSize];
    self.textFrame = (CGRect){textX,textY,textSize};
    
    // picturesView
//    CGFloat toolbarY = 0;
    CGFloat h = 0 ;
    if (retweeted_status.pic_urls.count) {
        
        CGFloat picturesViewX = textX;
        CGFloat picturesViewY = CGRectGetMaxY(self.textFrame) + DCStatusCellMargin;
        
        // 根据图片的个数计算picturesView的size
        CGSize picturesSize = [DCStatusPicturesView sizeWithPicturesCount:retweeted_status.pic_urls.count];
        
        CGFloat picturesViewW = picturesSize.width;
        CGFloat picturesViewH = picturesSize.height;
        
        self.picturesFrame = (CGRect){picturesViewX,picturesViewY,picturesViewW,picturesViewH};
        
        
//        toolbarY = CGRectGetMaxY(self.picturesFrame) + DCStatusCellMargin;
        
        h = CGRectGetMaxY(self.picturesFrame) + DCStatusCellMargin;
    }
    else
    {
        h = CGRectGetMaxY(self.textFrame) + DCStatusCellMargin;
        
//        toolbarY = CGRectGetMaxY(self.textFrame) + DCStatusCellMargin;
    }
    
    
    // retweetedView里的toolbar
//    if (retweeted_status.detail) {   // 是用在正文，才需要计算toolbar的frame
//        
//        CGFloat toolbarW = 200;
//        CGFloat toolbarX = DCScreenW - toolbarW;
//        CGFloat toolbarH = 20;
//        self.toolbarFrame = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);
//        
//        h = CGRectGetMaxY(self.toolbarFrame) + DCStatusCellMargin;
//    }
    
    
    
    // 自己frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = DCScreenW;
    self.frame = CGRectMake(x, y, w, h);
    
}
@end
