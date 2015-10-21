//
//  UIBarButtonItem+LQYExtension.h
//  baisibudejie
//
//  Created by shasha on 15/10/21.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LQYExtension)
/**
 * 通过图片创建一个UIBarButtonItem 对象
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
