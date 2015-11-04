//
//  LQYTopicViewController.m
//  baisibudejie
//
//  Created by shasha on 15/11/4.
//  Copyright © 2015年 shasha. Topic rights reserved.
//

#import "LQYTopicViewController.h"
#import <MJExtension.h>
#import "LQYHTTPSessionManager.h"
#import "LQYTopicCell.h"
#import "LQYDIYHeader.h"
#import "LQYDIYFooter.h"

@interface LQYTopicViewController ()

@property (nonatomic, strong) LQYHTTPSessionManager *manager; /**< 请求管理者 */

@property (nonatomic, strong) NSMutableArray <LQYTopic *> *topics; /**< 存放数组模型 */

@property (nonatomic, copy) NSString *maxtime; /**< 用来存储加载下一页的参数 */

@end

static NSString * const topicId = @"topicCell";

@implementation LQYTopicViewController
#pragma mark - 懒加载

- (LQYTopicType)type {return 0;}

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
    
    //设置 tableView
    [self setupTableView];
    
    // 属性数据
    [self refreshTopics];
}

/**
 *  设置 tableView
 */
- (void)setupTableView
{
    // 设置 tableView 的内边距 导航栏44 + 状态栏20 + 顶部标题40 = 104
    self.tableView.contentInset = UIEdgeInsetsMake(104, 0, 49, 0);
    // 设置滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.backgroundColor = LQYCommonBgColor;
    
    //self.tableView.rowHeight = 500;
    // 取消 cell 的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LQYTopicCell class]) bundle:nil] forCellReuseIdentifier:topicId];
}

/**
 *  属性数据
 */
- (void)refreshTopics
{
    // 下拉刷新
    self.tableView.header = [LQYDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    // 设置 header 的透明度
    self.tableView.header.automaticallyChangeAlpha = YES;
    // 进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 上拉刷新
    self.tableView.footer = [LQYDIYFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}
#pragma mark - 刷新数据
/**
 *  上拉刷新加载更多数据
 */
- (void)loadMoreTopics
{
    // 请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"type"] = @(self.type);
    parameters[@"c"] = @"data";
    parameters[@"maxtime"] = self.maxtime;
    
    __weak typeof(self) wealSelf = self;
    [self.manager GET:LQYRequestUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        // 存储返回下一页的数据
        wealSelf.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典转模型
        NSArray *moreTopics = [LQYTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 拼接数组 ,把新返回的数据拼接的帖子数组中
        [wealSelf.topics addObjectsFromArray:moreTopics];
        
        // 刷新数据
        [wealSelf.tableView reloadData];
        
        // 停止刷新
        [wealSelf.tableView.footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (error) {
            LQYLog(@"%@",error);
        }
        // 停止刷新
        [wealSelf.tableView.footer endRefreshing];
        
    }];
}

/**
 *  下拉刷新加载数据
 */
- (void)loadNewTopics
{
    // 请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @(self.type);
    
    __weak typeof(self) weakSelf = self;
    
    [self.manager GET:LQYRequestUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        // 存储返回下一页的数据
        weakSelf.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典转模型
        weakSelf.topics = [LQYTopic objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新数据
        [weakSelf.tableView reloadData];
        
        // 结束刷新
        [weakSelf.tableView.header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (error) {
            LQYLog(@"%@",error);
        }
        // 结束刷新
        [weakSelf.tableView.header endRefreshing];
        
    }];
    
}

#pragma mark - tableView的数据源方法
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

#pragma mark - tableView 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return self.topics[indexPath.row].cellHeight;
}

@end
