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
#import "LQYTestViewController.h"

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
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 使 setTabBar 只调用一次,确定发布按钮只创建一次,添加到 tabBar 上一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 设置tabBar
        [self setTabBar];
    });
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
    [self addOneChildViewController:[[LQYEssenceViewController alloc]init] title:@"精华" normalImage:@"tabBar_essence_icon"  selectImage:@"tabBar_essence_click_icon"];
    
    // 新帖
    [self addOneChildViewController:[[LQYNewViewController alloc]init] title:@"新帖" normalImage:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    // 添加一个 [发布按钮] 的占位控制器
    [self addOneChildViewController:[[LQYTestViewController alloc]init] title:nil normalImage:nil selectImage:nil];
    
    // 关注
    [self addOneChildViewController:[[LQYNewViewController alloc]init] title:@"关注" normalImage:@"tabBar_friendTrends_icon"selectImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    [self addOneChildViewController:[[LQYNewViewController alloc]init]title:@"我" normalImage:@"tabBar_me_icon"selectImage:@"tabBar_me_click_icon"];
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
    vc.view.backgroundColor = LQYRandomColor;
    if (title) {
        vc.tabBarItem.title = title;
        // 设置图片
        vc.tabBarItem.image = [UIImage imageNamed: normalImage];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    [self addChildViewController:vc];
}
/**
 *  设置 tabBar 添加发布按钮
 */
- (void)setTabBar
{
    UIButton *pubshButton = [[UIButton alloc]init];
    // 设置图片
    [pubshButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [pubshButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
    // 设置按钮的位置和尺寸
    pubshButton.frame = CGRectMake(0, 0, self.tabBar.bounds.size.width / 5, self.tabBar.bounds.size.height);
    pubshButton.center = CGPointMake(self.tabBar.bounds.size.width * 0.5, self.tabBar.bounds.size.height * 0.5);
    [pubshButton addTarget:self action:@selector(pubshButton:) forControlEvents:UIControlEventTouchUpInside];
    // 添加到 tabBar 上
    [self.tabBar addSubview:pubshButton];
}

#pragma mark - 监听按钮的点击
- (void)pubshButton:(UIButton *)button
{
    NSLogFun;
    // 点击按钮 .Modal 出控制器
    [self presentViewController:[[LQYTestViewController alloc]init] animated:YES completion:nil];
}

@end
