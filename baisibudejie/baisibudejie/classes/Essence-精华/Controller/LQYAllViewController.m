//
//  LQYAllViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYAllViewController.h"

@interface LQYAllViewController ()

@end

@implementation LQYAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置 tableView 的内边距 导航栏44 + 状态栏20 + 顶部标题40 = 104
    self.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
    // 设置滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    NSLogFun
}

#pragma mark - Table view data source
/**
 * 返回一共有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 50;
}

/**
 *  返回 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - 第 %zd 行",self.title,indexPath.row];
    
    return cell;
}

@end
