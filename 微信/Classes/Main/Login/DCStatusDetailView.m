//
//  DCStatusDetailView.m
//  微信
//
//  Created by 尚承教育 on 15/8/3.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCStatusDetailView.h"
#import "DCStatusDetailViewFrame.h"
#import "DCStatus.h"
#import "DCUser.h"
#import "DCStatusPicturesView.h"

@interface DCStatusDetailView()

// name
@property(weak, nonatomic) UILabel *nameLabel;

// text
@property(weak, nonatomic) UILabel *textLabel;

// picturesView
@property(weak, nonatomic) DCStatusPicturesView *picturesView;



@end
@implementation DCStatusDetailView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        //  背景
        self.image = [UIImage resizableImage:@"timeline_retweet_background"];
        
        // neme
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = DCStatusRetweetedNameFont;
        nameLabel.textColor = DCStatusHightLightedColor;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // text
        UILabel *textLabel = [[UILabel alloc]init];
        textLabel.font = DCStatusRetweetedTextFont;
        textLabel.numberOfLines = 0;
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        // picturesView
        DCStatusPicturesView *picturesView = [[DCStatusPicturesView alloc]init];
        [self addSubview:picturesView];
        self.picturesView = picturesView;
        
        
        //  toolbar
//        JWStatusRetweetedToolbar *toolbar = [[JWStatusRetweetedToolbar alloc]init];
//        [self addSubview:toolbar];
//        self.toolbar = toolbar;
        
        
    }
    return self;
}


//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    // 跳转控制器
//    UITabBarController *tabbarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
//    // 当前选中的导航控制器
//    UINavigationController *nav = (UINavigationController *)tabbarVc.selectedViewController;
//    
//    // push微博详情控制器
//    JWStatusDetailViewController *detailVc = [[JWStatusDetailViewController alloc] init];
//    detailVc.status = self.retweetedFrame.retweeted_status;
//    [nav pushViewController:detailVc animated:YES];
//    
//    
//}

-(void)setRetweetedFrame:(DCStatusDetailViewFrame *)retweetedFrame
{
    _retweetedFrame = retweetedFrame;
    
    DCStatus *status = retweetedFrame.retweeted_status;
    DCUser *user = status.user;
    
    // name
    NSString *name = [NSString stringWithFormat:@"@%@",user.name];
    
    self.nameLabel.frame = retweetedFrame.nameFrame;
    self.nameLabel.text = name;
    
    // text
    self.textLabel.frame = retweetedFrame.textFrame;
    self.textLabel.text = status.text;
    
    // picturesView
    self.picturesView.frame = retweetedFrame.picturesFrame;
    // 图片数组给picturesView，它里面根据数组的个数创建多个pictureView
    self.picturesView.pictures = status.pic_urls;
    
    
//    // toolbar
//    self.toolbar.frame = retweetedFrame.toolbarFrame;
//    self.toolbar.status = status;
}


@end
