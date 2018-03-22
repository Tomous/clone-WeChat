//
//  DCStatus.h
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DCUser;
@interface DCStatus : NSObject

/** string	微博创建时间 */
@property (copy, nonatomic) NSString *created_at;

/**	string	字符串型的微博ID */
@property (copy, nonatomic) NSString *idstr;


/** string	微博信息内容 */
@property (copy, nonatomic) NSString *text;

/** string	微博来源*/
@property (copy, nonatomic) NSString *source;

@property(strong,nonatomic)DCUser *user;

/** object	被转发的原微博信息字段，当该微博为转发微博时返回 详细 */
@property (strong, nonatomic) DCStatus *retweeted_status;


/** int	评论数 */
@property(assign, nonatomic) int comments_count;



/** pic_ids	object	微博配图*/  // 放JWPhoto
@property (strong, nonatomic) NSArray *pic_urls;

/** 标记是不是用到正文里的 */

@property(assign, nonatomic,getter=isDetail) BOOL detail;

@end
