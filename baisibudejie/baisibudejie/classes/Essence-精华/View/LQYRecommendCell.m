//
//  LQYRecommendCell.m
//  baisibudejie
//
//  Created by shasha on 15/10/24.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYRecommendCell.h"
#import "LQYRecommend.h"
#import <UIImageView+WebCache.h>

@interface LQYRecommendCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageList;
@property (weak, nonatomic) IBOutlet UILabel *themeName;

@property (weak, nonatomic) IBOutlet UILabel *subNumber;

@end

@implementation LQYRecommendCell

- (void)setRecommend:(LQYRecommend *)recommend
{
    _recommend = recommend;
    
    // 通过第三方框架 SDWebImage 来设置图片, SDWebImage 已经处理好了图片的缓存问题
    [self.imageList sd_setImageWithURL:[NSURL URLWithString:recommend.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themeName.text = recommend.theme_name;
    
    if (recommend.sub_number > 10000) {
        self.subNumber.text = [NSString stringWithFormat:@"%.1f万人订阅",recommend.sub_number / 10000.0];
    }else {
        self.subNumber.text = [NSString stringWithFormat:@"%zd人订阅",recommend.sub_number];
    }
}

/**
 *  重写setFrame 的作用: 监听设置 cell 的 frame 的过程
 */
- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    [super setFrame:frame];
}
@end
