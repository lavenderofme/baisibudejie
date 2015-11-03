//
//  LQYSeeBigViewController.m
//  baisibudejie
//
//  Created by shasha on 15/11/3.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYSeeBigViewController.h"
#import <UIImageView+WebCache.h>
#import "LQYTopic.h"
#import <SVProgressHUD.h>
#import <Photos/Photos.h>

@interface LQYSeeBigViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *imageView; /**< 图片 */
@end

static NSString * const LQYCollectionName = @"百思不得姐";

@implementation LQYSeeBigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = [UIScreen mainScreen].bounds;
    // 把 scrollView 添加到控制器 view 的第一个自控制器
    [self.view insertSubview:scrollView atIndex:0];
    scrollView.delegate = self;
    
    // 添加imageView
    UIImageView *imageView = [[UIImageView alloc]init];
    // 加载图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.large_image]];
    // 设置 imageView 的 frame
    imageView.width = scrollView.width;
    imageView.height = imageView.width * self.topic.height / self.topic.width;
    imageView.x = 0;
    if (imageView.height >= scrollView.height) { // 图片大于屏幕
        imageView.y = 0;
    } else {
        imageView.centerY = scrollView.height * 0.5;
    }
    // 把 imageView 添加到 scrollView 上
    [scrollView addSubview:imageView];
    
    self.imageView = imageView;
    
    // 设置 scrollView 的滚动范围
    scrollView.contentSize = CGSizeMake(0, imageView.height);
    
    // 缩放比例
    CGFloat maxScale = self.topic.height / imageView.height;
    if (maxScale > 1.0) {
        scrollView.maximumZoomScale = maxScale;
    }

    
}

#pragma mark - 监听按钮点击
- (IBAction)backController:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)savePicture:(id)sender {
    
    //0.判断状态
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied) { // 用户拒绝当前应用访问相册
        LQYLog(@"用户拒绝当前应用访问相册 - 提醒用户打开访问开关");
    } else if (status == PHAuthorizationStatusRestricted) { // 家长控制
        LQYLog(@"家长控制 - 不允许访问");
    } else if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
        LQYLog(@"用户还没有做出选择");
        
        [self saveImage];
    } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许当前应用访问相册
        LQYLog(@"用户允许当前应用访问相册");
        
        [self saveImage];
    }
}

/**
 *  返回相册
 */
- (PHAssetCollection *)collection
{
    // 先获得之前创建过的相册
    PHFetchResult<PHAssetCollection *> *collectionResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *collection in collectionResult) {
        if ([collection.localizedTitle isEqualToString:LQYCollectionName]) {
            return collection;
        }
    }
    
    // 如果相册不存在, 就创建新的相册(文件夹)
    __block NSString *collectionId = nil;
   
    // 这个方法会在相册创建完毕后才会返回
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        // 新建一个PHAssetCollectionChangeRequest对象, 用来创建一个新的相册
        collectionId = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:LQYCollectionName].placeholderForCreatedAssetCollection.localIdentifier;
    } error:nil];
    
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[collectionId] options:nil].firstObject;
}

/**
 *  保存图片到相册
 */
- (void)saveImage
{
    /*
     PHAsset : 一个PHAsset对象就代表一个资源文件, 比如一张图片
     
     PHAssetCollection : 一个PHAssetCollection对象就代表一个相册
     */
    
    __block NSString *assetId = nil;
    
    // 1.存储图片到"相机胶卷"
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{ // 这个block里面存放一些"修改"性质的代码
        // 新建一个PHAssetCreationRequest对象, 保存图片到"相机胶卷"
        // 返回PHAsset(图片)的字符串标识
        assetId = [PHAssetCreationRequest creationRequestForAssetFromImage:self.imageView.image].placeholderForCreatedAsset.localIdentifier;
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (error) {
            LQYLog(@"保存图片到相机胶卷中失败");
            return;
        }
        
        LQYLog(@"成功保存图片到相机胶卷中");
        
        // 2.获得相册对象
        PHAssetCollection *collection = [self collection];
        
        // 3.将"相机胶卷"中的图片 添加到 新的相册
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            PHAssetCollectionChangeRequest *reqeust = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:collection];
            
            // 根据唯一标识获得相片对象
            PHAsset *asset = [PHAsset fetchAssetsWithLocalIdentifiers:@[assetId] options:nil].firstObject;
            // 添加图片到相册中
            [reqeust addAssets:@[asset]];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (error) {
                LQYLog(@"添加图片到相册中失败");
                return;
            }
            LQYLog(@"成功添加图片到相册中");
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [SVProgressHUD showSuccessWithStatus:@"保存成功"];
            }];
        }];
    }];
}
/**
 *  成功保存图片到相册中
 *  这个方法,方法名不重要,重要的是参数
 */
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }else {
        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
    }
    
}

#pragma mark - scrollView 代理方法
/**
 *  返回一个scrollView内部的子控件进行缩放
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
@end
