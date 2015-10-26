//
//  LQYMeViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYMeViewController.h"
#import "LQYSettingController.h"
#import "LQYMeCell.h"
#import "LQYMeFooter.h"

@interface LQYMeViewController ()

@end

static NSString * const LQYMeCellId = @"me";

@implementation LQYMeViewController

#pragma mark - 初始化操作

- (void)viewDidLoad {
    [super viewDidLoad];
    // tableView 的样式只有在创建的时候才能设置,因为 tableView 的 style属性是只读的
//    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    // 设置 tableView
    
    [self setupTableView];
    
    // 设置导航栏信息
    [self setupNav];
   
}
/**
 *  设置 tableView
 */
- (void)setupTableView
{
    // 设置背景颜色
    self.view.backgroundColor = LQYCommonBgColor;
    
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = LQYMargin;
    self.tableView.contentInset =  UIEdgeInsetsMake(LQYMargin - LQYGorupFirstCellY, 0, 0, 0);
    
    // 注册 cell
    [self.tableView  registerClass:[LQYMeCell class] forCellReuseIdentifier:LQYMeCellId];
    
    self.tableView.tableFooterView = [[LQYMeFooter alloc]init];
}
/**
 *  设置导航栏信息
 */
- (void)setupNav
{
    // 设置导航栏的标题
    self.navigationItem.title = @"我的";
    
    //设置导航栏的按钮
    UIBarButtonItem *rightItem1 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(mineMoonClick)];
    UIBarButtonItem *rightItem2 = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(mineSettingClick)];
    
    self.navigationItem.rightBarButtonItems = @[rightItem2,rightItem1];
    

}

#pragma mark - table view 的数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LQYMeCell *cell = [tableView dequeueReusableCellWithIdentifier:LQYMeCellId];
    if (indexPath.section == 0) { // 第 0 组
        // cell.imageView.image = [UIImage circleImageNamed:@"setup-head-default"];
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
        
        cell.textLabel.text = @"登录/注册";
        
    }else { // 第 1 组
        
        // 考虑到 cell 的循环利用 ,写上这几会更加严谨
        cell.imageView.image = nil;
        cell.textLabel.text = @"离线下载";
    }
    
    return  cell;
}
#pragma mark - 监听按钮点击
- (void)mineMoonClick
{
    NSLogFun;
}

- (void)mineSettingClick
{
    LQYSettingController *setting = [[LQYSettingController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:setting animated:YES];
}

@end
