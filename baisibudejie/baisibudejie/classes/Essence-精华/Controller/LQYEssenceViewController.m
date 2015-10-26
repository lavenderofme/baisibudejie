//
//  LQYEssenceViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYEssenceViewController.h"
#import "LQYRecommendViewController.h"
#import "LQYTitleButton.h"

@interface LQYEssenceViewController ()

@property (nonatomic, weak) LQYTitleButton *selectedButton; /**< 记录选中的按钮 */
@end

@implementation LQYEssenceViewController

#pragma mark - 初始化设置
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = LQYCommonBgColor;
    
    // 设置导航栏
    [self setupNav];
    
    // 添加 scrollView
    [self addScrollView];
    
    // 添加顶部标题
    [self setUPTitleView];
    
    
}

/**
 *  添加顶部标题
 */
- (void)setUPTitleView
{
    UIView *titleView = [[UIView alloc]init];
    titleView.frame = CGRectMake(0, 64, self.view.width, 40);
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [self.view addSubview:titleView];
    
    // 标题数组
    NSArray *titles = @[@"全部",@"视频",@"声音",@"图片",@"段子"];
    
    // 添加标题
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = titleView.width / titles.count;
    CGFloat buttonH = titleView.height;

    for (int i = 0; i < titles.count; i++) {
        LQYTitleButton *titleButton = [[LQYTitleButton alloc]init];
       
        // 监听按钮的点击
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置按钮的 frame
        buttonX = i * buttonW;
        titleButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [titleView addSubview:titleButton];

        // 设置按钮的字体 和 颜色
        titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        // 设置数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        }
    
}

/**
 *  添加 scrollView
 */
- (void)addScrollView
{
    UIScrollView *scroll = [[UIScrollView alloc]init];
    scroll.frame = self.view.bounds;
    scroll.backgroundColor = LQYRandomColor;
    [self.view addSubview:scroll];
}

/**
 *  设置导航栏
 */
- (void)setupNav
{
    // 设置导航栏的标题
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    // 设置导航栏的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(mainTagSubClick)];
}
#pragma mark - 监听按钮点击
- (void)mainTagSubClick
{
    LQYRecommendViewController *recommend = [[LQYRecommendViewController alloc]init];
    [self.navigationController pushViewController:recommend animated:YES];
}

/**
 *  监听标题按钮的点击
 */
- (void)titleButtonClick:(LQYTitleButton *)button
{
    // 让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 被点击的按钮称为选中状态
    button.selected = YES;
    
    // 被点击的按钮 -> 称为选中的按钮
    self.selectedButton = button;
}
@end
