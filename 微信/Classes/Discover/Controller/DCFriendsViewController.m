//
//  DCFriendsViewController.m
//  微信
//
//  Created by 尚承教育 on 15/7/25.
//  Copyright (c) 2015年 尚承教育. All rights reserved.
//

#import "DCFriendsViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "DCNavigationViewController.h"
#import "DCLittleImgClickViewController.h"
#import "AFNetworking.h"
#import "DCAccountTool.h"
#import "DCStatus.h"
#import "DCUser.h"
#import "UIImageView+WebCache.h"
#import "DCHttpTool.h"
#import "MBProgressHUD+MJ.h"
#import "MJExtension.h"
#import "DCUserinfoParam.h"
#import "DCUserTool.h"
#import "DCHomeParam.h"
#import "DCStatusTool.h"
#import "DCStatusFrame.h"
#import "DCStatusCell.h"
#import "DCHomeResult.h"
#import "DCLoadMoreView.h"
#import "DCPopView.h"
#import "DCSendMessageController.h"
#import "DCComposePhotoView.h"
#import "DCTextView.h"
#define margin 10;


@interface DCFriendsViewController ()<DCPopViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

// 现在数组放JWStatusFrame模型  之前放的是JWStatus模型
@property (strong, nonatomic) NSMutableArray *statusFrame;

@property(strong,nonatomic)DCLoadMoreView *loadMoreView;

@property(strong,nonatomic)DCPopView *homePopView;

@property(strong,nonatomic)UIView *popView;

@end

@implementation DCFriendsViewController

-(UIView *)popView
{
    if (!_popView) {
        _popView = [[UIView alloc]init];
    }
    return _popView;
}

-(NSMutableArray *)statusFrame
{
    if (!_statusFrame) {
        
        _statusFrame = [NSMutableArray array];
    }
    return _statusFrame;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // 加载数据
    [self requestStatuses];

    // 添加下拉刷新控件
    [self setupRefreshControl];
    
    //上拉加载
    [self loadMoreStatuses];
    
    DCLoadMoreView *loadMoreView = [DCLoadMoreView loadMoreView];
    self.tableView.tableFooterView = loadMoreView;
    self.loadMoreView = loadMoreView;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"PayScaniconHl" higImageName:nil action:@selector(cameraClick) target:self];

    [self setupTableHeaderView];
    
}

-(void)setupRefreshControl
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(refreshNewStatuses:) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:refreshControl];
}

/**
 *  下拉刷新
 */

-(void)refreshNewStatuses:(UIRefreshControl *)refreshControl
{
    DCHomeParam *param = [[DCHomeParam alloc]init];
    DCStatusFrame *statusFrame = [self.statusFrame firstObject];
    
    if (statusFrame) {
        param.since_id = @([statusFrame.status.idstr longLongValue]);
    }
    [DCStatusTool loadHomeStatusWithParam:param success:^(DCHomeResult *result) {
        
        NSArray *newStatus = [self statusFrameArrWithStatusArr:result.statuses];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newStatus.count)];
        
         // 把新数据插到旧的数组里面去
        [self.statusFrame insertObjects:newStatus atIndexes:indexSet];
        
        [self.tableView reloadData];
        
        [refreshControl endRefreshing];
        
    } failure:^(NSError *error) {
        NSLog(@"请求失败--%@",error);
        [refreshControl endRefreshing];
        

    }];
}
// 第一次进来不用刷新加载微博数据
-(void)requestStatuses
{
    DCHomeParam *param = [[DCHomeParam alloc]init];
    param.access_token = [DCAccountTool account].access_token;
    
    [DCStatusTool loadHomeStatusWithParam:param success:^(DCHomeResult *result) {
        
        self.statusFrame = [NSMutableArray array];
        
        // JWStatusArr -> JWStatusFrameArr
        NSArray *newStatuses = [self statusFrameArrWithStatusArr:result.statuses];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newStatuses.count)];
        
        [self.statusFrame insertObjects:newStatuses atIndexes:indexSet];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.statusFrame.count <= 0 || self.loadMoreView.isRefreshing) return;
    
    // 1.差距
    CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    // 刚好能完整看到footer的高度
    CGFloat sawFooterH = self.view.height - self.tabBarController.tabBar.height;
    
    // 2.如果能看见整个footer
    if (delta <= (sawFooterH - 0)) {
        // 进入上拉刷新状态
        [self.loadMoreView startRefresh];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 加载更多的微博数据
            [self loadMoreStatuses];
        });
    }

}
/**
 *  上拉加载更多数据
 */
-(void)loadMoreStatuses
{
    DCHomeParam *param = [[DCHomeParam alloc]init];
    
    DCStatusFrame *statusFrame = [self.statusFrame lastObject];
    if (statusFrame) {
        param.max_id = @([statusFrame.status.idstr longLongValue] - 1);
    }
    
    
    [DCStatusTool loadHomeStatusWithParam:param success:^(DCHomeResult *result) {
        
        // JWStatusArr -> JWStatusFarmeArr
        NSArray *moreStatues = [self statusFrameArrWithStatusArr:result.statuses];
        
        [self.statusFrame addObjectsFromArray:moreStatues];
        
        [self.tableView reloadData];
        
        [self.loadMoreView endRefresh];
        
    } failure:^(NSError *error) {
        NSLog(@"加载更多失败");
        [self.loadMoreView endRefresh];
    }];
    

}
-(NSArray *)statusFrameArrWithStatusArr:(NSArray *)statusArr
{
    NSMutableArray *tempArr = [NSMutableArray array];
    
    for (DCStatus *status in statusArr) {
        DCStatusFrame *statusFrame = [[DCStatusFrame alloc]init];
        statusFrame.status = status;
        [tempArr addObject:statusFrame];
    }
    return tempArr;
}

-(void)setupTableHeaderView
{
    UIButton *bigImgBtn = [[UIButton alloc]init];
    bigImgBtn.size = CGSizeMake(self.view.size.width, 250);
    bigImgBtn.backgroundColor = [UIColor greenColor];
    [bigImgBtn addTarget:self action:@selector(bigImgBtnClick) forControlEvents:UIControlEventTouchDown];
    self.tableView.tableHeaderView = bigImgBtn;
    
    UIImageView *bigImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xingkong"]];
    bigImgView.size = bigImgBtn.size;
    [bigImgBtn addSubview:bigImgView];
    
    UILabel *nameTitle = [[UILabel alloc]init];
    nameTitle.width = 150;
    nameTitle.height = 30;
    nameTitle.centerX = bigImgBtn.width / 2;
    nameTitle.y = bigImgBtn.height - nameTitle.height - margin;
    nameTitle.text = @"牵着小狗看夕阳";
    nameTitle.textColor = [UIColor whiteColor];
    nameTitle.textAlignment = NSTextAlignmentCenter;
    nameTitle.font = [UIFont boldSystemFontOfSize:15];
    [bigImgBtn addSubview:nameTitle];
    
    UIButton *littleImgBtn = [[UIButton alloc]init];
    littleImgBtn.backgroundColor = [UIColor yellowColor];
    littleImgBtn.size = CGSizeMake(100, 100);
    littleImgBtn.x = bigImgBtn.width - littleImgBtn.size.width - margin;
    littleImgBtn.y = bigImgBtn.height - littleImgBtn.height / 3 * 2;
    [littleImgBtn addTarget:self action:@selector(littleImgBtnClick) forControlEvents:UIControlEventTouchDown];
    [bigImgBtn addSubview:littleImgBtn];
    
    UIImageView *littleImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beauty"]];
    littleImgView.size = littleImgBtn.size;
    [littleImgBtn addSubview:littleImgView];

    

    
    
}

-(void)cameraClick
{
    // 弹出菜单
    DCPopView *popView = [DCPopView popViewWithContentView:self.popView];
    
    self.homePopView = popView;
    // 设置灰色背景
    popView.dimBackgroud = YES;
    
//    popView.arrowPosition = DCPopViewArrowPositionRight;
    
    popView.delegate = self;
    
    CGFloat viewH = 80;
    CGFloat viewW = 300;
    CGFloat viewX = (self.view.width - viewW) / 2;
    CGFloat viewY = (self.view.height - viewH) / 2;
    UIView *view = [[UIButton alloc]initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
    view.backgroundColor = [UIColor whiteColor];
    [popView addSubview:view];
    
    UIButton *btnPicture = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, viewW, viewH / 2)];
    [btnPicture setTitle:@"照片" forState:UIControlStateNormal];
    btnPicture.titleEdgeInsets = UIEdgeInsetsMake(0, -230, 0, 0);
    [btnPicture setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnPicture addTarget:self action:@selector(picture) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btnPicture];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, viewH / 2, viewW, 1)];
    label.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:label];
    
    UIButton *btnCamera = [[UIButton alloc]initWithFrame:CGRectMake(0, viewH / 2, viewW, viewH / 2)];
    [btnCamera setTitle:@"小视频" forState:UIControlStateNormal];
    btnCamera.titleEdgeInsets = UIEdgeInsetsMake(0, -230, 0, 0);
    [btnCamera setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnCamera addTarget:self action:@selector(camera) forControlEvents:UIControlEventTouchUpInside];

    [view addSubview:btnCamera];
    
    [popView showInRect:CGRectMake(0, 0, 0,0)];
}

/**
 *  打开相册
 */
-(void)picture
{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) return;
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.allowsEditing = NO;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
    
    [self.homePopView removeFromSuperview];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    DCSendMessageController *sendVC = [[DCSendMessageController alloc]init];
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:sendVC];
    [self presentViewController:nav animated:YES completion:nil];
    
    DCComposePhotoView *photoView = [[DCComposePhotoView alloc]init];
    photoView.width = 400;
    photoView.height = 500;
    photoView.x = 20;
    photoView.y = 200;
    
    [photoView addImage:image];
    
    [sendVC.view addSubview:photoView];
    [self.view addSubview:sendVC.view];

}

/**
 *  打开照相机
 */
-(void)camera
{
    NSLog(@"---camera----");
    
    [self.homePopView removeFromSuperview];

    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) return;
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc]init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];

}



-(void)bigImgBtnClick
{
    NSLog(@"----bigImgBtnClick----");
}

-(void)littleImgBtnClick
{
    DCLittleImgClickViewController *VC = [[DCLittleImgClickViewController alloc]init];
    DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:VC];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 控制footer是否隐藏
    self.loadMoreView.hidden = self.statusFrame.count == 0;
    
    return self.statusFrame.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCStatusCell *cell = [DCStatusCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrame[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCStatusFrame *statusFrame = self.statusFrame[indexPath.row];
    
    return statusFrame.cellHeight;
}








//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(NSString *)kUTTypeImage])
//    {
//        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
//
//        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
//    }
//    {
//        [picker dismissViewControllerAnimated:YES completion:nil];
//
//        DCSendMessageController *sendVC = [[DCSendMessageController alloc]init];
//        DCNavigationViewController *nav = [[DCNavigationViewController alloc]initWithRootViewController:sendVC];
//        [self presentViewController:nav animated:YES completion:nil];
//        self.pictureView = sendVC.view;
//        [self.view addSubview:sendVC.view];
//    }
//
//}
//
//-(void)image:(UIImage *) image didFinishSavingWithError:(NSError *) error
//   contextInfo: (void *) contextInfo;
//{
//    DCComposePhotoView *photoView = [[DCComposePhotoView alloc]init];
//    photoView.width = 400;
//    photoView.height = 500;
//    photoView.x = 20;
//    photoView.y = 200;
//    [photoView addImage:image];
//
//    [self.pictureView addSubview:photoView];
//
//}
//
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [picker dismissViewControllerAnimated:YES completion:nil];
//}

@end
