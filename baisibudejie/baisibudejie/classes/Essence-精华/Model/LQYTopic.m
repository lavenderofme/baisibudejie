//
//  LQYTopic.m
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTopic.h"
#import <MJExtension.h>
#import "LQYComment.h"
#import "LQYUser.h"

@implementation LQYTopic

/**
 *  日期处理
 */
- (NSString *)created_at
{
    // 创建一个日期格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    // 设置日期格式
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // NSString -> NSDate
    NSDate *createDate = [formatter dateFromString:_created_at];
    
    // 判断
    if (createDate.isThisYear) { // 今年
        if (createDate.isToday) { // 今天
            // 当前时间
            NSDate *nowDate = [NSDate date];
            // 获取日历对象
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSCalendarUnit unit = NSCalendarUnitHour | NSCalendarUnitMinute| NSCalendarUnitSecond;
            NSDateComponents *cmps = [calendar components:unit fromDate:createDate toDate:nowDate options:0];
            if (cmps.hour >= 1 ) {
                return [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            }else if (cmps.minute > 1){
                return [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            }else {
                return @"刚刚";
            }
        }else if(createDate.isYesterday){ // 昨天
            formatter.dateFormat = @" 昨天 HH:mm:ss";
            return [formatter stringFromDate:createDate];
            
        }else{ // 其他
            formatter.dateFormat = @"MM-dd HH:mm:ss";
            return [formatter stringFromDate:createDate];
        }
    }else // 非今年
    {
        return _created_at;
    }
}

/**
 *  中间控件的 frame
 */
//- (CGRect)centerFrame
//{
//    // 中间控件的 x
//    CGFloat centerViewX = LQYMargin;
//    
//    // 文字(内容)的 Y
//    CGFloat textY = 60; // 图片的高度 + 两个 LQYMargin
//    // 文字(内容)的 W
//    CGFloat MaxTextW = [UIScreen mainScreen].bounds.size.width - 2 * LQYMargin;
//    // 文字(内容)的 H
//    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(MaxTextW,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;
//    
//    // 中间控件的 y
//    CGFloat centerViewY = textY + textH + LQYMargin;
//    
//    // 中间控件的 W
//    CGFloat centerViewW = MaxTextW;
//    
//    // 中间控件的 H
//    CGFloat centerViewH = self.height * centerViewW / self.width;
//    if (centerViewH > [UIScreen mainScreen].bounds.size.height) {
//        centerViewH = 200;
//        self.bigPicture = YES;
//    }
//   
//    
//    return CGRectMake( centerViewX, centerViewY, centerViewW, centerViewH);
//}

//- (CGFloat)cellHeight
//{
//    // 文字(内容)的 Y
//    CGFloat textY = 60; // 图片的高度 + 两个 LQYMargin
//    // 文字(内容)的 W
//    CGFloat MaxTextW = [UIScreen mainScreen].bounds.size.width - 2 * LQYMargin;
//    // 文字(内容)的 H
//    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(MaxTextW,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;
//    _cellHeight = textH + textY + LQYMargin;
//    
//    if (self.type != LQYTopicTypeWord) { // 有中间控件
//        
//        // 中间控件的高度
//        CGFloat centerH = self.centerFrame.size.height;
//        _cellHeight += centerH + LQYMargin;
//    }
//    
//    if (self.topCmt) { // 有做热评论
//        CGFloat topCmtTitleH = 18;
//        NSString *topCmtContent = [NSString stringWithFormat:@"%@: %@",self.topCmt.user.username,self.topCmt.content];
//        CGFloat topCmtContentH = [topCmtContent boundingRectWithSize:CGSizeMake(MaxTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
//        _cellHeight += topCmtTitleH + topCmtContentH + LQYMargin;
//        
//    }
//    
//    // 底部工具条
//    CGFloat bottomToolH = 35;
//    _cellHeight += bottomToolH + LQYMargin;
//    
//    return _cellHeight;
//}

- (CGFloat)cellHeight
{
    // 文字(内容)的 Y
    CGFloat textY = 60; // 图片的高度 + 两个 LQYMargin
    // 文字(内容)的 W
    CGFloat MaxTextW = [UIScreen mainScreen].bounds.size.width - 2 * LQYMargin;
    // 文字(内容)的 H
    CGFloat textH = [self.text boundingRectWithSize:CGSizeMake(MaxTextW,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height;
    _cellHeight = textH + textY + LQYMargin;

    if (self.type != LQYTopicTypeWord) { // 有中间控件
        
        //中间控件的 x
        CGFloat centerViewX = LQYMargin;
        //中间控件的 y
        CGFloat centerViewY = textY + textH + LQYMargin;
        // 中间控件的 W
        CGFloat centerViewW = MaxTextW;
        // 中间控件的 H
        CGFloat centerViewH = self.height * centerViewW / self.width;
        if (centerViewH > [UIScreen mainScreen].bounds.size.height) {
            centerViewH = 200;
            self.bigPicture = YES;
        }
        // 设置中件控件的 frame
        _centerFrame = CGRectMake(centerViewX, centerViewY, centerViewW, centerViewH);
        
        // 计算 cell 的高度
         _cellHeight += centerViewH + LQYMargin;

    }

    if (self.topCmt) { // 有做热评论
        CGFloat topCmtTitleH = 18;
        NSString *topCmtContent = [NSString stringWithFormat:@"%@: %@",self.topCmt.user.username,self.topCmt.content];
        CGFloat topCmtContentH = [topCmtContent boundingRectWithSize:CGSizeMake(MaxTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size.height;
        _cellHeight += topCmtTitleH + topCmtContentH + LQYMargin;

    }

    // 底部工具条
    CGFloat bottomToolH = 35;
    _cellHeight += bottomToolH + LQYMargin;

    return _cellHeight;
}

@end
