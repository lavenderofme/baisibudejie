//
//  LQYTopicVoiceView.m
//  baisibudejie
//
//  Created by shasha on 15/11/3.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTopicVoiceView.h"
#import "LQYSeeBigViewController.h"
#import <UIImageView+WebCache.h>
#import "LQYTopic.h"

@interface LQYTopicVoiceView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;

@end

@implementation LQYTopicVoiceView
+ (instancetype)voiceView
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)awakeFromNib
{
    // 去除默认的autoresizingMask设置
    self.autoresizingMask = UIViewAutoresizingNone;
    
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
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil];
    self.playCountLabel.text = [NSString stringWithFormat:@"%zd播放",topic.playcount];
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",topic.voicetime / 60,topic.voicetime % 60];
}
@end
