//
//  LQYRecommendCell.m
//  baisibudejie
//
//  Created by shasha on 15/10/24.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYRecommendCell.h"
#import "LQYRecommend.h"

@interface LQYRecommendCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageList;
@property (weak, nonatomic) IBOutlet UILabel *themeName;

@property (weak, nonatomic) IBOutlet UILabel *subNumber;

@end

@implementation LQYRecommendCell

- (void)setRecommend:(LQYRecommend *)recommend
{
    _recommend = recommend;
    
    [self.imageList setHeaderWithUrl:recommend.image_list];
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
