//
//  LQYAllViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYAllViewController.h"
#import <MJExtension.h>
#import "LQYHTTPSessionManager.h"
#import "LQYTopic.h"
#import "LQYTopic.h"
#import "LQYTopicCell.h"

@interface LQYAllViewController ()

@property (nonatomic, strong) LQYHTTPSessionManager *manager; /**< 请求管理者 */

@property (nonatomic, strong) NSArray <LQYTopic *> *topics; /**< 存放数组模型 */
@end

static NSString * const topicId = @"topicCell";

@implementation LQYAllViewController
#pragma mark - 懒加载
/** manager 属性的懒加载 */
- (LQYHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [LQYHTTPSessionManager manager ];
    }
    return _manager;
}

#pragma mark - 初始化操作
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置 tableView 的内边距 导航栏44 + 状态栏20 + 顶部标题40 = 104
    self.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
    // 设置滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.rowHeight = 200;
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LQYTopicCell class]) bundle:nil] forCellReuseIdentifier:topicId];
    
    // 请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @1;
    
    [self.manager GET:LQYRequestUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        // 字典转模型
        self.topics = [LQYTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新数据
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - Table view data source
/**
 * 返回一共有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.topics.count;
}

/**
 *  返回 cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LQYTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:topicId];
    
    LQYTopic *topic = self.topics[indexPath.row];
    
    // 设置数据
    cell.topic = topic;
    
    return cell;
}

@end
