//
//  LQYEssenceViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYEssenceViewController.h"
#import "LQYRecommendViewController.h"

@interface LQYEssenceViewController ()

@end

@implementation LQYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = LQYCommonBgColor;
    
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

@end
