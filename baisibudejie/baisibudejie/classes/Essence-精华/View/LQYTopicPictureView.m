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

@interface LQYTopicPictureView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seeBigPicture;
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
}

- (void)setTopic:(LQYTopic *)topic
{
    _topic = topic;
    
    // 设置图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
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
