//
//  DCComposePhotoView.h
//  微信
//
//  Created by 尚承教育 on 15/8/5.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCComposePhotoView : UIView

-(void)addImage:(UIImage *)image;

// 提供一个方法，取出所有的image
-(NSArray *)images;

@end
