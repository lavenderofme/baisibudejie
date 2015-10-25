//
//  LQYRecommendViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/24.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYRecommendViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "LQYRecommendCell.h"
#import "LQYRecommend.h"

@interface LQYRecommendViewController ()

/**< 所以的标签数据(存放LQYRecommend数组模型) */
@property (nonatomic, strong) NSArray <LQYRecommend *> *recommends;

@end

static NSString *const recomendId = @"recomend";

@implementation LQYRecommendViewController

#pragma mark - 初始化操作
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置 tableView
    [self setupTableView];
    
    // 加载数据
    [self loadNewRecommendTags];
    
    
}
/**
 *  对 tableView 进行一些设置
 */
- (void)setupTableView
{
    // 设置标题
    self.title = @"推荐标签";

    // 设置背景颜色
    self.tableView.backgroundColor = LQYCommonBgColor;
    
    // 设置 tableView 的 cell 的行高
    self.tableView.rowHeight = 70;
    // 设置 cell 的分割线的样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LQYRecommendCell class]) bundle:nil] forCellReuseIdentifier:recomendId];
}
/**
 *   发送网络请求 ,加载推荐标签数据
 */ 
- (void)loadNewRecommendTags
{
    // 请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    
    [[AFHTTPSessionManager manager]GET:LQYRequestUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        self.recommends = [LQYRecommend objectArrayWithKeyValuesArray:responseObject];
        
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
}

#pragma mark -  tableView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.recommends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LQYRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:recomendId];
    
    cell.recommend = self.recommends[indexPath.row];
    
    return cell;
}

@end
