//
//  LQYNavigationController.m
//  baisibudejie
//
//  Created by shasha on 15/10/21.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYNavigationController.h"

@interface LQYNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LQYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 给控制器添加 pop 手势
    self.interactivePopGestureRecognizer.delegate = self;
 
}
/**
 *  拦截导航控制器的栈顶控制器 push 操作,在这个方法中可以得到所以push 进来的自控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        // 隐藏底部的 tabBar 工具条
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        //backButton.titleLabel.font = [UIFont systemFontOfSize:16]
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);

        [backButton sizeToFit];
        
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    }
    // 将控制器 push到栈中
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popToRootViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  判断手势是否有效
 *  @return YES :手势有效 
 *  @return NO :手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    /*判断栈了的控制器的个数 
     1.如果 > 1,说明不是导航控制器的根控制器可以进行 POP 操作,
     2.如果 <= 1,说明是导航控制器的根控制器,不能在进行 POP 操作
     
     */
    return self.viewControllers.count > 1;
}
@end
