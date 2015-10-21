
//
//  LQYTestViewController.m
//  baisibudejie
//
//  Created by shasha on 15/10/21.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTestViewController.h"

@interface LQYTestViewController ()

@end

@implementation LQYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = LQYRandomColor;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
