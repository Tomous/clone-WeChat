//
//  DCPurseItem.m
//  微信
//
//  Created by 尚承教育 on 15/7/30.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCPurseItem.h"

@interface DCPurseItem ()
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;


@end
@implementation DCPurseItem

+(instancetype)PurseNavItem
{
    return [[[NSBundle mainBundle]loadNibNamed:@"DCPurseItem" owner:nil options:nil] lastObject];
}

-(void)addTarget:(id)target action:(SEL)action
{
    [self.iconBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
