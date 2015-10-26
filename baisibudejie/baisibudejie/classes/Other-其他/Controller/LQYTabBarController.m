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
#import "LQYTabBar.h"
#import "LQYNavigationController.h"

@interface LQYTabBarController ()

@end

@implementation LQYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置 tabBar 的文字属性
    [self setupTabBarAttributes];
    
    // 添加子控制器
    [self addChildViewCOntrollers];
    
    // 设置tabBar
    [self setTabBar];
 
}

#pragma mark - 初始化设置
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
    [self addOneChildViewController:[[LQYNavigationController alloc]initWithRootViewController:[[LQYEssenceViewController alloc]init]] title:@"精华" normalImage:@"tabBar_essence_icon"  selectImage:@"tabBar_essence_click_icon"];
    
    // 新帖
    [self addOneChildViewController:[[LQYNavigationController alloc]initWithRootViewController:[[LQYNewViewController alloc]init]]title:@"新帖" normalImage:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    // 关注
    LQYFriendTrendsViewController *friendTrends = [UIStoryboard storyboardWithName:@"LQYFriendTrendsViewController" bundle:nil].instantiateInitialViewController;
    [self addOneChildViewController:[[LQYNavigationController alloc]initWithRootViewController:friendTrends] title:@"关注" normalImage:@"tabBar_friendTrends_icon"selectImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    [self addOneChildViewController:[[LQYNavigationController alloc]initWithRootViewController:[[LQYMeViewController alloc]initWithStyle:UITableViewStyleGrouped]]title:@"我" normalImage:@"tabBar_me_icon"selectImage:@"tabBar_me_click_icon"];

    
}

/**
 *  添加一个控制器
 *
 *  @param vc          添加的控制器名
 *  @param title       控制器的标题
 *  @param normalImage 默认状态下的图片
 *  @param selectImage 选中状态下的图片
 */
- (void)addOneChildViewController:(UIViewController *)vc title:(NSString *)title normalImage:(NSString *)normalImage selectImage:(NSString *)selectImage
{
    vc.tabBarItem.title = title;
    // 设置图片
    vc.tabBarItem.image = [UIImage imageNamed: normalImage];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
}
/**
 *  设置 tabBar 添加发布按钮
 */
- (void)setTabBar
{
    [self setValue:[[LQYTabBar alloc]init] forKey:@"tabBar"];
}


@end
