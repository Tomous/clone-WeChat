//
//  DCLoginViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/29.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCLoginViewController.h"
#import "DCAccount.h"
#import "AFNetworking.h"
#import "DCAccessTokenParam.h"
#import "DCAccountTool.h"
#import "DCFriendsViewController.h"
#import "DCWeiChatTableViewController.h"
#import "DCControllerTool.h"
#import "DCAccessTokenResult.h"
@interface DCLoginViewController ()<UIWebViewDelegate>

@end

@implementation DCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 提供webView加载登陆页面
    UIWebView *webView= [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.frame = self.view.bounds;
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",JWAppKey,JWRedirect_uri]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    // 拿到回调页面后面拼接的code
    // 每次请求的url
    
    NSString *urlStr = request.URL.relativeString;
    
    NSRange range = [urlStr rangeOfString:[NSString stringWithFormat:@"%@/?code=",JWRedirect_uri]];
    
    if (range.location != NSNotFound) {
        
        // 截取code
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        
        NSLog(@"%@----%@-",urlStr,code);
        
        // 用code获取accessToken
        [self accessTokenWithCode:code];
        // 不跳到回调页
        return NO;

    }
    return YES;
}

-(void)accessTokenWithCode:(NSString *)code
{

    DCAccessTokenParam *param = [[DCAccessTokenParam alloc]init];
    
    param.code = code;
    param.client_id = JWAppKey;
    param.client_secret = JWAppSecret;
    param.grant_type = @"authorization_code";
    param.redirect_uri = JWRedirect_uri;
    
    [DCAccountTool accessTokenWithParam:param success:^(DCAccessTokenResult *account) {
        
        NSLog(@"请求成功--%@",account);
        
        // 1 存储account
        [DCAccountTool save:account];

         // 2 选择rootVc
        [DCControllerTool chooesRootVC];


    } failure:^(NSError *error) {
        NSLog(@"请求失败-%@",error);
    }];
      
}

@end
