//
//  LQYTabBarController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTabBarController.h"

@interface LQYTabBarController ()

@end

@implementation LQYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     - (void)setTitleTextAttributes:(nullable NSDictionary<NSString *,id> *)attributes forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
     
     1.方法或者属性后面有个UI_APPEARANCE_SELECTOR宏,才可以通过appearance对象统一设置
     */
    // 普通状态下的文字
    NSMutableDictionary *normalAttributes = [NSMutableDictionary dictionary];
    normalAttributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字
    NSMutableDictionary *selectAttributes = [NSMutableDictionary dictionary];
    selectAttributes[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];

    // 添加自控制器
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc1.tabBarItem.title = @"精华";
    /*
    // 设置文字颜色
    [vc1.tabBarItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [vc1.tabBarItem setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];
     */
    // 设置图片
    vc1.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_essence_click_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc1];
    
    UIViewController *vc2 = [[UIViewController alloc]init];
    vc2.view.backgroundColor = [UIColor grayColor];
    vc2.tabBarItem.title = @"新帖";
    /*
    // 设置文字颜色
    [vc2.tabBarItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [vc2.tabBarItem setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];
     */
    // 设置图片
    vc2.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_new_click_icon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc2];
    
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor yellowColor];
    vc3.tabBarItem.title = @"关注";
    /*
    // 设置文字颜色
    [vc3.tabBarItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [vc3.tabBarItem setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];
     */
    // 设置图片
    vc3.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    vc3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc3];
    
    UIViewController *vc4 = [[UIViewController alloc]init];
    vc4.view.backgroundColor = [UIColor greenColor];
    vc4.tabBarItem.title = @"我";
    /*
    // 设置文字颜色
    [vc4.tabBarItem setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    [vc4.tabBarItem setTitleTextAttributes:selectAttributes forState:UIControlStateSelected];
     */
    // 设置图片
    vc4.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    vc4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_me_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc4];
}

@end
