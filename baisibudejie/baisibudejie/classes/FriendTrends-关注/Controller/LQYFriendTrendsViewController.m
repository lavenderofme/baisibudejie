//
//  LQYFriendTrendsViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYFriendTrendsViewController.h"
#import "LQYTestViewController.h"

@interface LQYFriendTrendsViewController ()

@end

@implementation LQYFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = LQYCommonBgColor;
    
    // 设置导航栏的标题
    self.navigationItem.title = @"我的关注";
    
    // 设置导航栏的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsRecommentClick)];
}

- (void)friendsRecommentClick
{
    [self.navigationController pushViewController:[[LQYTestViewController alloc]init] animated:YES];
}

@end
