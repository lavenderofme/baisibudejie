//
//  LQYTabBar.m
//  baisibudejie
//
//  Created by shasha on 15/10/21.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTabBar.h"

@interface LQYTabBar()

@property (nonatomic, weak) UIButton *pubshButton; /**< 发布按钮 */

@end
@implementation LQYTabBar

/**
 *  通过代码创建一个控件时,通过 alloc/init 方法创建一个控件是底层会调用 initWithFrame:
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 设置tabBar 的背景图片
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        
        // 添加发布按钮
        UIButton *pubshButton = [[UIButton alloc]init];
        // 设置图片
        [pubshButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [pubshButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [pubshButton sizeToFit];
        // 添加到 tabBar 上
        [self addSubview:pubshButton];
        self.pubshButton = pubshButton;
        
    }
    return self;
}

/**
 *  在 initWithFrame: 方法中的到的子控件的 frame 是不准确的
    布局子控件的操作一般放在 layoutSubviews中
    在 layoutSubviews中的能够得到子控件的准确的 frame
 */
- (void)layoutSubviews
{
    // 使用layoutSubviews布局子控件时,一定要调用 [super layoutSubviews]
    [super layoutSubviews];
    // tabBar 的宽和高
    CGFloat tabBarW = self.bounds.size.width;
    CGFloat tabBarH = self.bounds.size.height;
    
    // 按钮 的宽和高
    CGFloat buttonW = tabBarW / 5;
    CGFloat buttonH = tabBarH;
    CGFloat ButtonX = 0;
    CGFloat ButtonY = 0;
    
    // 发布按钮的 center
    self.pubshButton.center = CGPointMake(tabBarW * 0.5, tabBarH * 0.5);
    
    // 按钮的下标,记录 taBBar上边的按钮
    NSInteger index = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        
        // 判断取出的按钮是不是 tabBarItem 对应的按钮,
        NSString *tabBarName = NSStringFromClass(tabBarButton.class);
        // 可以通过打印 tabBar 的自控件找到 tabBar 上面按钮对应的类名
        if (![tabBarName isEqualToString:@"UITabBarButton"]) continue;
        
        // 按钮的位置
        ButtonX = index * buttonW;
        if (index >= 2) { // 右边的两个按钮
            
            ButtonX += buttonW;
        }
        tabBarButton.frame = CGRectMake(ButtonX, ButtonY, buttonW, buttonH);
        
        index++;
    }
}

@end
