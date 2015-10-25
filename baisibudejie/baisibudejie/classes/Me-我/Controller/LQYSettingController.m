//
//  LQYSettingController.m
//  baisibudejie
//
//  Created by shasha on 15/10/21.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYSettingController.h"


@interface LQYSettingController ()

@end

@implementation LQYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    
}

#pragma mark - Table view数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %zd 行",indexPath.row];
    return cell;
}

@end
