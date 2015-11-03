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

@interface LQYSeeBigViewController ()

@property (nonatomic, weak) UIImageView *imageView; /**< 图片 */
@end

@implementation LQYSeeBigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = [UIScreen mainScreen].bounds;
    // 把 scrollView 添加到控制器 view 的第一个自控制器
    [self.view insertSubview:scrollView atIndex:0];
    
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
    
    // 保存相片的交卷相册
    UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
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
@end
