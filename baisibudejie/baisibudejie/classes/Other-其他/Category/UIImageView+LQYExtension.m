//
//  UIImageView+LQYExtension.m
//  baisibudejie
//
//  Created by shasha on 15/10/25.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "UIImageView+LQYExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (LQYExtension)

/**
 *  给 UIImageView 设置图片
 *
 *  @param url 图片下载的地址
 */
- (void)setHeaderWithUrl:(NSString *)url
{
    [self setCircleHeaderWithUrl:url];
}

/**
 *  给 UIImageView 设置圆形图片
 *
 *  @param url 图片下载的地址
 */
- (void)setCircleHeaderWithUrl:(NSString *)url
{
    UIImage *placeholder = [UIImage circleImageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 如果图片下载失败不做任何处理,让它显示占位图片
        if (image == nil) return;
        // 把图片裁剪成 圆形
        self.image = [image circleImage];
            }];
}

/**
 *  给 UIImageView 设置通过 URL 下载下来的默图片
 *
 *  @param url 图片下载的地址
 */
- (void)setRectHeaderWithURL:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
@end
