//
//  DCSearchBar.m
//  微信
//
//  Created by 尚承教育 on 15/7/23.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCSearchBar.h"

@interface DCSearchBar ()<UISearchBarDelegate>

@property(strong,nonatomic)UIButton *voiceBtn;
@property(strong,nonatomic)UISearchBar *searchBar;
@property(strong,nonatomic)UIView *searchView;

@end
@implementation DCSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        self.searchView = view;
    }
    return self;
}
- (void)viewDidLoad {
    
    [self setupSearchBar];
}


-(void)setupSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 5, self.searchView.size.width, 30)];
    
    searchBar.backgroundImage = [UIImage imageNamed:@"widget_searchbar_cell_bg"];
    searchBar.placeholder = @"搜索";
    
    UIButton *voiceBtn = [[UIButton alloc]init];
    voiceBtn.frame = CGRectMake(280, 0, 30, 30);
    [voiceBtn setImage:[UIImage imageNamed:@"VoiceSearchStartBtn"] forState:UIControlStateNormal];
    [voiceBtn setImage:[UIImage imageNamed:@"VoiceSearchStartBtnHL"] forState:UIControlStateHighlighted];
    
    [voiceBtn addTarget:self action:@selector(voiceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.voiceBtn = voiceBtn;
    [searchBar addSubview:voiceBtn];
    
    searchBar.delegate = self;
    self.searchBar = searchBar;
    
    [self.searchView addSubview:searchBar];
    
    
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    self.voiceBtn.frame = CGRectMake(220, 0, 30, 30);
    searchBar.showsCancelButton = YES;
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 44, self.searchView.size.width, self.searchView.size.height)];
    
    self.searchView = searchView;
    [self.searchView addSubview:searchView];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.x = 0;
    imageView.y = 60;
    imageView.width = 300;
    imageView.height = 100;
    imageView.image = [UIImage imageNamed:@"fts_search_education"];
    [searchView addSubview:imageView];
    
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    self.voiceBtn.frame = CGRectMake(280, 0, 30, 30);
    searchBar.showsCancelButton = NO;
    self.searchView.hidden = YES;
}
-(void)voiceBtnClick:(UIButton *)btn
{
    NSLog(@"--------%@",btn);
}


@end
