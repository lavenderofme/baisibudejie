//
//  LQYMeFooter.m
//  baisibudejie
//
//  Created by shasha on 15/10/25.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYMeFooter.h"
#import <MJExtension.h>
#import "LQYHTTPSessionManager.h"
#import "LQYSquare.h"
#import "LQYSquareButton.h"
#import "LQYWebViewController.h"

@interface LQYMeFooter()

@property (nonatomic, strong) LQYHTTPSessionManager *manager; /**< 请求管理者 */

@property (nonatomic, strong) NSArray *squares; /**< 存放模型的数组 */

@end

@implementation LQYMeFooter

#pragma mark - 懒加载
- (LQYHTTPSessionManager *)manager
{
    if (_manager == nil) {
        
        _manager = [LQYHTTPSessionManager manager];
    }
    return _manager;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 请求参数
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"a"] = @"square";
        parameters[@"c"] = @"topic";
       
        [self.manager GET:LQYRequestUrl parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            self.squares = [LQYSquare objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            [self creatSquares:self.squares];
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
        }];
        
    }
    return self;
}

- (void)creatSquares:(NSArray *)squares
{
    // 一个有多少行
    NSInteger columnsCount = 4;
    
    NSInteger count = squares.count;
    // 按钮的宽 和 高
    CGFloat buttonW = self.width / columnsCount;
    CGFloat buttonH = buttonW;
    
    for (int i = 0; i < count; i++) {
        
        LQYSquareButton *button = [LQYSquareButton buttonWithType:UIButtonTypeCustom];
    
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        // 把按钮添加到 footerView 上
        [self addSubview:button];
        // 设置按钮的 frame
        CGFloat buttonX = (i % columnsCount) * buttonW;
        CGFloat buttonY = (i / columnsCount) * buttonH ;
        button.frame  = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 给按钮设置数据
        button.square = squares[i];
        
    }
    
    // 总行数 == (总个数 + 每行的最大个数 - 1) / 每行的最大个数
    NSInteger rowsCount = (count + columnsCount - 1) / columnsCount;
    // 设置footer的高度 == 总行数 * 一个按钮的高度
    self.height = rowsCount * buttonH;
}
- (void)buttonClick:(LQYSquareButton *)button
{
    NSString *url = button.square.url;
    
    if ([url hasPrefix:@"mod://"]) {// 特殊处理
        if ([url hasSuffix:@"BDJ_To_Check"]) {
            NSLog(@"跳转到Check控制器");
        } else if ([url hasSuffix:@"App_To_SearchUser"]) {
            NSLog(@"跳转到SearchUser控制器");
        }
    } else if ([url hasPrefix:@"http://"]){
        
        // 获得当前的导航控制器
        UITabBarController *tab = (UITabBarController *)self.window.rootViewController;
        
        UINavigationController *nav = tab.selectedViewController;
        
        // push 到其他控制器
        LQYWebViewController *web = [[LQYWebViewController alloc]init];
        web.url = url;
        web.navigationItem.title = button.square.name;
        [nav pushViewController:web animated:YES];
        
    }else {
        NSLog(@"其他");

    }
    
}
@end
