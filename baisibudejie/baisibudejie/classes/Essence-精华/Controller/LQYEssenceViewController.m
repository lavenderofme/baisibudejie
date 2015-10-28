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
#import "LQYAllViewController.h"
#import "LQYVideoViewController.h"
#import "LQYVoiceViewController.h"
#import "LQYPictureViewController.h"
#import "LQYWordViewController.h"

@interface LQYEssenceViewController ()

@property (nonatomic, weak) LQYTitleButton *selectedButton; /**< 记录选中的按钮 */

@property (nonatomic, weak) UIView *titleIndicatorView; /**< 底部指示器 */

@property (nonatomic, weak) UIScrollView *scrollView; /**< 添加到控制器上的 veiw, 用来存放所有的 topic 控制器 */

@end

@implementation LQYEssenceViewController

#pragma mark - 初始化设置
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = LQYCommonBgColor;
    
    // 设置导航栏
    [self setupNav];
    
    // 添加子控制器
    [self addChildViewControllers];
    
    // 添加 scrollView
    [self addScrollView];
    
    // 添加顶部标题
    [self setUPTitleView];
    
    
}

/**
 *  添加子控制器
 */
- (void)addChildViewControllers
{
    // 全部
    LQYAllViewController *all = [[LQYAllViewController alloc]init];
    all.title = @"全部";
    [self addChildViewController:all];
    
    // 视频
    LQYVideoViewController *video = [[LQYVideoViewController alloc]init];
    video.title = @"视频";
    [self addChildViewController:video];
    
    // 声音
    LQYVoiceViewController *voice = [[LQYVoiceViewController alloc]init];
    voice.title = @"声音";
    [self addChildViewController:voice];
    
    // 图片
    LQYPictureViewController *picture = [[LQYPictureViewController alloc]init];
    picture.title = @"图片";
    [self addChildViewController:picture];
    
    // 段子
    LQYWordViewController *word = [[LQYWordViewController alloc]init];
    word.title = @"段子";
    [self addChildViewController:word];
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
    
    // 自控制器的个数
    NSInteger count = self.childViewControllers.count;
    
    // 添加标题
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = titleView.width / count;
    CGFloat buttonH = titleView.height;

    for (int i = 0; i < count; i++) {
        LQYTitleButton *titleButton = [[LQYTitleButton alloc]init];
       
        // 监听按钮的点击
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 给按钮添加 tag 记录按钮
        titleButton.tag = i;
        
        // 设置按钮的 frame
        buttonX = i * buttonW;
        titleButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [titleView addSubview:titleButton];

        // 设置按钮的字体 和 颜色
        titleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [titleButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        // 设置数据
        [titleButton setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        }
    
    // 添加底部指示器
    UIView *titleIndicatorView = [[UIView alloc]init];
    [self.view addSubview:titleIndicatorView];

    // 第一个按钮
    LQYTitleButton *firstTitleButton = titleView.subviews.firstObject;
    titleIndicatorView.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    titleIndicatorView.height = 1;
    titleIndicatorView.bottom = titleView.bottom;
    
    // 让第一按钮成选中状态
    firstTitleButton.selected = YES;
    // 被选中的按钮是 第一个添加的按钮
    self.selectedButton = firstTitleButton;
    
    // 自动根据当前内容计算尺寸
    [firstTitleButton.titleLabel sizeToFit];
    
    titleIndicatorView.width = firstTitleButton.titleLabel.width;
    titleIndicatorView.centerX = firstTitleButton.centerX;
    
    self.titleIndicatorView = titleIndicatorView;
    
    }

/**
 *  添加 scrollView
 */
- (void)addScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = LQYCommonBgColor;
    [self.view addSubview:scrollView];
    
    // 禁止掉[自动设置scrollView的内边距]
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置 scrollView 的大小
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * scrollView.width, 0);
    // 添加控制器的 View
    for (int i = 0; i < self.childViewControllers.count; i++) {
        // 取出当前控制器的子控制器
        UITableViewController *vc = self.childViewControllers[i];
            
        vc.tableView.x = i * scrollView.width;
        vc.tableView.y = 0;
        vc.tableView.width = scrollView.width;
        vc.tableView.height = scrollView.height;
        
        [scrollView addSubview:vc.tableView];
    }
    
    self.scrollView = scrollView;
    
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
- (void)titleButtonClick:(LQYTitleButton *)titleButton
{
    // 让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 被点击的按钮称为选中状态
    titleButton.selected = YES;
    
    // 被点击的按钮 -> 称为选中的按钮
    self.selectedButton = titleButton;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.titleIndicatorView.width = titleButton.titleLabel.width;
        self.titleIndicatorView.centerX = self.selectedButton.centerX;
        
    }];
    
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.width;
    [self.scrollView setContentOffset:offset animated:YES];
}
@end
