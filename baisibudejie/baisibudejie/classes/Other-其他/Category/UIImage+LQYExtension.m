//
//  UIImage+LQYExtension.m
//  baisibudejie
//
//  Created by shasha on 15/10/25.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "UIImage+LQYExtension.h"

@implementation UIImage (LQYExtension)

- (UIImage *)circleImage
{
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    //获得图层上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 添加一个圆到上下文
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(context, rect);
    
    // 裁剪(根据添加到上下文中的路径进行裁剪)
    // 以后超出裁剪后形状的内容都看不见
    CGContextClip(context);
    
    // 绘制图片到图形上下文
    [self drawInRect:rect];
    
    // 从图形上下文获得图片
     UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下颚
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)circleImageNamed:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}
@end
