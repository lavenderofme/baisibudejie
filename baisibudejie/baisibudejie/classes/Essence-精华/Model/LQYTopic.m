//
//  LQYTopic.m
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYTopic.h"
#import <MJExtension.h>

@implementation LQYTopic

/**
 *  声明数组中存放什么类型的模型
 */
+ (NSDictionary *)objectClassInArray
{
    return @{@"top_cmt" : @"LQYComment" };
}

/*
 1.今年
 1> 今天
 1) 时间间隔 >= 1个小时 -> 5小时前
 2) 1个小时 > 时间间隔 >= 1分钟 -> 25分钟前
 3) 时间间隔 < 1分钟 -> 刚刚
 
 2> 昨天 -> 昨天 17:56:34
 
 3> 其他 -> 07-06 19:47:57
 
 2.非今年 -> 2014-08-06 19:47:57
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

@end
