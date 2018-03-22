//
//  DCSendMessageController.m
//  微信
//
//  Created by 尚承教育 on 15/8/5.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCSendMessageController.h"
#import "DCTextView.h"
#import "DCComposePhotoView.h"
#import "DCSendMessageParam.h"
#import "DCStatusTool.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "DCAccountTool.h"
@interface DCSendMessageController ()

@property(strong,nonatomic)DCComposePhotoView *photoView;

@property(strong,nonatomic)DCTextView *textView;


@end

@implementation DCSendMessageController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self setupNavigationBar];
    
    // 添加自定义的textView
    [self setupTextView];
    
    // 初始化PhotoView
//    [self setupPhotosView];


}

//进去直接弹出键盘
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 耗时
    [self.textView becomeFirstResponder];
}

-(void)setupNavigationBar
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(send)];
    
}

-(void)setupTextView
{
    DCTextView *textView = [[DCTextView alloc]initWithFrame:self.view.bounds];
    
    // 滚动textView,出发方法，里面退下键盘
//    textView.delegate = self;
    textView.placeHoledr = @"分享新鲜事...";
    
    
    [self.view addSubview:textView];
    self.textView = textView;
    
    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:textView];
    
}

//-(void)setupPhotosView
//{
//    DCComposePhotoView *photoView = [[DCComposePhotoView alloc]init];
//    photoView.y = 70;
//    photoView.width = self.textView.width;
//    photoView.height = self.textView.height;
//    
//    [self.textView addSubview:photoView];
//    self.photoView = photoView;
//}


// 监听textView文字改变，改变发送按钮的状态
-(void)textChange
{
    self.navigationItem.rightBarButtonItem.enabled = self.textView.text.length != 0;
}

// 发微博
- (void)send
{
    
    NSLog(@"-------send------");
    if (self.photoView.images.count) {  // 有图片
        [self composeWithImage];
    }
    else  // 没图片
    {
        [self composeWithoutImage];
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 发没有图片的微博
-(void)composeWithImage
{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"access_token"] = [DCAccountTool account].access_token;
    param[@"status"] = self.textView.text;
    
    // 图片转NSData
    NSData *data = UIImageJPEGRepresentation([self.photoView.images lastObject], 1.0);
    
    
    [manager POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        // 把NSData传给后台
        [formData appendPartWithFileData:data name:@"pic" fileName:@"statusPic.jpg" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [MBProgressHUD showSuccess:@"发表成功"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发表失败"];
    }];
    
}

// 发没有图片的微博
-(void)composeWithoutImage
{
    // 之前面向的是JWHttpTool,现在让JWStatusTool去发微博
    DCSendMessageParam *param = [[DCSendMessageParam alloc]init];
    
    param.status = self.textView.text;
    
    [DCStatusTool sendStatusWithParam:param success:^(DCSendMessageResult *result) {
        
        [MBProgressHUD showSuccess:@"发表成功"];
    } failure:^(NSError *error) {
        
        [MBProgressHUD showError:@"发表失败"];
    }];
    
}

- (void)cancel
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
