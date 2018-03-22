//
//  DCUser.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCUser : NSObject

/** name	string	友好显示名称 */
@property (copy, nonatomic) NSString *name;

/** profile_image_url	string	用户头像地址（中图），50×50像素 */
@property (copy, nonatomic) NSString *profile_image_url;

@end
