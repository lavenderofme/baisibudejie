//
//  LQYSettingController.m
//  baisibudejie
//
//  Created by shasha on 15/10/21.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYSettingController.h"
#import "LQYClearCachesCell.h"
#import "LQYSettingCell.h"


@interface LQYSettingController ()

@end

static NSString *const clearCachesCellId = @"clearCachesCell";
static NSString *const settingId = @"settingCell";


@implementation LQYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    
    self.tableView.backgroundColor = LQYCommonBgColor;
    
    // 注册 清理缓存的 cell
    [self.tableView registerClass:[LQYClearCachesCell class] forCellReuseIdentifier:clearCachesCellId];
    
    // 注册 普通的 cell
    [self.tableView registerClass:[LQYSettingCell class] forCellReuseIdentifier:settingId];
}


#pragma mark - Table view数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 1;
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) { // 清理缓存的 cell
        
        return [tableView dequeueReusableCellWithIdentifier:clearCachesCellId];
        
    }else { // 其他
        
        LQYSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:settingId];
        if (indexPath.row == 0) {
            cell.textLabel.text = @"检查更新";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"给我们评分";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"推送设置";
        } else {
            cell.textLabel.text = @"关于我们";
        }
        
        return cell;

    }
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LQYLog(@"第%zd 组 -- 第 %zd 行 ",indexPath.section ,indexPath.row);
}
@end
