//
//  LQYMeCell.m
//  baisibudejie
//
//  Created by shasha on 15/10/25.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYMeCell.h"

@implementation LQYMeCell

/**
 *  通过代码自定义 cell 默认底层会调用这个方法
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
        self.textLabel.textColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.imageView.image == nil) return;
    
    // 当设置 tableViewCell 的图片太大是对图片进行处理
    self.imageView.height = self.contentView.height - LQYMargin;
    self.imageView.width = self.imageView.height;
    self.imageView.centerY = self.contentView.height * 0.5;
    
    // 设置图片的 和 textLabel 之间的间距
    self.textLabel.x = self.imageView.right + LQYMargin;
    
    
}


@end
