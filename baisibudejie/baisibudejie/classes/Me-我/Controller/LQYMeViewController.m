//
//  LQYMeViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYMeViewController.h"
#import "LQYSettingController.h"

@interface LQYMeViewController ()

@end

@implementation LQYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = LQYCommonBgColor;
    
    // 设置导航栏的标题
    self.navigationItem.title = @"我的";
    
    //设置导航栏的按钮
    UIBarButtonItem *rightItem1 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(mineMoonClick)];
    UIBarButtonItem *rightItem2 = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(mineSettingClick)];
    
    self.navigationItem.rightBarButtonItems = @[rightItem2,rightItem1];
   
}

#pragma mark - 监听按钮点击
- (void)mineMoonClick
{
    NSLogFun;
}

- (void)mineSettingClick
{
    LQYSettingController *setting = [[LQYSettingController alloc]init];
    [self.navigationController pushViewController:setting animated:YES];
}

@end
