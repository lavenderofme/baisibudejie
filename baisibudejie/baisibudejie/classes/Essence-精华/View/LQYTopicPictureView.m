//
//  LQYTopicPictureView.m
//  baisibudejie
//
//  Created by shasha on 15/10/31.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTopicPictureView.h"
#import "LQYTopic.h"
#import <UIImageView+WebCache.h>
#import <DALabeledCircularProgressView.h>
#import "LQYSeeBigViewController.h"

@interface LQYTopicPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigPicture;
@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView*progressView;
@property (weak, nonatomic) IBOutlet UIImageView *placeholderImage;
@end

@implementation LQYTopicPictureView

+ (instancetype)pictureView
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)awakeFromNib
{
    // 去除默认的autoresizingMask设置
    self.autoresizingMask = UIViewAutoresizingNone;
    
    // 设置下载进度的圆角
    self.progressView.roundedCorners = 5;
    self.progressView.progressLabel.textColor = [UIColor whiteColor];
    
    // 监听图片点击查看大图
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick)]];
}
- (void)imageClick
{
    // 如果图片没有加载完毕在不做任何事情
    if (self.imageView == nil) return;
    
    LQYSeeBigViewController *bingVc = [[LQYSeeBigViewController alloc]init];
    bingVc.topic = self.topic;
    [self.window.rootViewController presentViewController:bingVc animated:YES completion:nil];
}

- (void)setTopic:(LQYTopic *)topic
{
    _topic = topic;
    
    // 设置图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // 显示下载体现
        self.placeholderImage.hidden = NO;
        self.progressView.hidden = NO;
        
        // 计算下载进度
        CGFloat progress = 1.0 * receivedSize / expectedSize;
        self.progressView.progress = progress;
        
        // 设置中间的文字
        self.progressView.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) { // 下载完毕
        self.progressView.hidden = YES;
        self.placeholderImage.hidden = YES;

    }];
    
    // 判断是不是 gif 图片
    self.gifView.hidden = !topic.is_gif;
    // 判断是不是大图
    self.seeBigPicture.hidden = !topic.isBigPicture;
    
    if (topic.bigPicture) {
        self.imageView.contentMode = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
    }else {
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = NO;
    }
    
}
@end
