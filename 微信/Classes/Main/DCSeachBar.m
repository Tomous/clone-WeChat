//
//  DCSeachBar.m
//  微信
//
//  Created by 尚承教育 on 15/7/23.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCSeachBar.h"

@interface DCSeachBar ()<UISearchBarDelegate>

@property(strong,nonatomic)UIButton *voiceBtn;
@property(strong,nonatomic)UISearchBar *searchBar;
@property(strong,nonatomic)UIView *searchView;

@end
@implementation DCSeachBar


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 5, self.size.width, 30)];
        
        searchBar.backgroundImage = [UIImage imageNamed:@"widget_searchbar_cell_bg"];
        searchBar.placeholder = @"搜索";
        
        UIButton *voiceBtn = [[UIButton alloc]init];
        voiceBtn.frame = CGRectMake(330, 0, 30, 30);
        [voiceBtn setImage:[UIImage imageNamed:@"VoiceSearchStartBtn"] forState:UIControlStateNormal];
        [voiceBtn setImage:[UIImage imageNamed:@"VoiceSearchStartBtnHL"] forState:UIControlStateHighlighted];
        
        [voiceBtn addTarget:self action:@selector(voiceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        self.voiceBtn = voiceBtn;
        [searchBar addSubview:voiceBtn];
        
        searchBar.delegate = self;
        self.searchBar = searchBar;
        
        [self addSubview:searchBar];
        

        
    }
    return self;
}



-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{

    self.voiceBtn.frame = CGRectMake(270, 0, 30, 30);
    searchBar.showsCancelButton = YES;
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 35, self.size.width, 700)];
    searchView.backgroundColor = [UIColor lightGrayColor];

    self.searchView = searchView;
    [self addSubview:searchView];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.y = 60;
    imageView.width = 300;
    imageView.height = 100;
    imageView.x = self.searchView.width / 2 - imageView.width / 2;
    imageView.image = [UIImage imageNamed:@"fts_search_education"];
    imageView.alpha = 1.0;
    imageView.backgroundColor = [UIColor clearColor];
    [searchView addSubview:imageView];

    
    
    
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    self.voiceBtn.frame = CGRectMake(330, 0, 30, 30);
    searchBar.showsCancelButton = NO;
    self.searchView.hidden = YES;
}

-(void)voiceBtnClick:(UIButton *)btn
{
    NSLog(@"--------%@",btn);
}

+(instancetype)searchBar
{
    return [[self alloc]init];
}


@end
