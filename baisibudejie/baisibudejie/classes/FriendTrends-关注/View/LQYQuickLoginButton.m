//
//  LQYQuickLoginButton.m
//  baisibudejie
//
//  Created by shasha on 15/10/24.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYQuickLoginButton.h"

@implementation LQYQuickLoginButton

- (void)awakeFromNib
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 图片的frame
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    // w文字的 fram
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.y;
    
}
@end
