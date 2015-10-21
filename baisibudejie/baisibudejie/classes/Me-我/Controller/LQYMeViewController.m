//
//  LQYMeViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/20.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYMeViewController.h"

@interface LQYMeViewController ()

@end

@implementation LQYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    UIButton *right1 = [[UIButton alloc]init];
    [right1 sizeToFit];
    [right1 setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [right1 setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateHighlighted];
    UIButton *right2 = [[UIButton alloc]init];
    [right2 sizeToFit];
    [right2 setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [right2 setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc]initWithCustomView:right1];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc]initWithCustomView:right2];
    
    self.navigationItem.rightBarButtonItems = @[rightItem2,rightItem1];
   
}

@end
