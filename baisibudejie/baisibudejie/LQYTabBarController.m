//
//  LQYTabBarController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTabBarController.h"
#import "LQYEssenceViewController.h"
#import "LQYNewViewController.h"
#import "LQYFriendTrendsViewController.h"
#import "LQYMeViewController.h"

@interface LQYTabBarController ()

@end

@implementation LQYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置 tabBar 的文字属性
    [self setupTabBarAttributes];
    
    // 添加子控制器
    [self addChildViewCOntrollers];
    
    
}
/**
 *  统一设置设置 tabBar 的文字属性
 */
- (void)setupTabBarAttributes
{
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
    
}

/**
 *  添加子控制器
 */
- (void)addChildViewCOntrollers
{
    // 精华
    [self addOneChildViewController:[[LQYEssenceViewController alloc]init] title:@"精华" normalImage:@"tabBar_essence_icon"  selectImage:@"tabBar_essence_click_icon"];
    
    // 新帖
    [self addOneChildViewController:[[LQYNewViewController alloc]init] title:@"新帖" normalImage:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    // 关注
    [self addOneChildViewController:[[LQYNewViewController alloc]init] title:@"关注" normalImage:@"tabBar_friendTrends_icon"selectImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    [self addOneChildViewController:[[LQYNewViewController alloc]init]title:@"我" normalImage:@"tabBar_me_icon"selectImage:@"tabBar_me_click_icon"];
}

- (void)addOneChildViewController:(UIViewController *)vc title:(NSString *)title normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage
{
    
    vc.view.backgroundColor = [UIColor grayColor];
    vc.tabBarItem.title = title;
    // 设置图片
    vc.tabBarItem.image = [UIImage imageNamed: normalImage];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
}


@end
