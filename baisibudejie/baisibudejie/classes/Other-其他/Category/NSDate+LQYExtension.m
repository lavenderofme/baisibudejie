//
//  NSDate+LQYExtension.m
//  baisibudejie
//
//  Created by shasha on 15/10/29.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "NSDate+LQYExtension.h"

@implementation NSDate (LQYExtension)

/**
 *  是否是今天
 */
- (BOOL)isToday
{
    // 通过日历对象获取当前的时间
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 取出日期组成部分包含哪些信息
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    // 获取调用日期的组成成分
    NSDateComponents *selfComponents = [calendar components:unit fromDate:self];
    // 获取当前日期的组成成分
    NSDateComponents *nowComponents = [calendar components:unit fromDate:[NSDate date]];
    
    // 如果传入的日期 和当前的 日期的 年月日 相同,则是同一天
    return selfComponents.year == nowComponents.year && selfComponents.month == nowComponents.month && selfComponents.day == nowComponents.day;
}

/**
 *  是否是昨天
 */
- (BOOL)isYesterday
{
//    // 通过日历对象获取当前的时间
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    // 取出日期组成部分包含哪些信息
//    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//    
//    // 获取调用日期的组成成分
//    NSDateComponents *selfComponents = [calendar components:unit fromDate:self];
//    // 获取当前日期的组成成分
//    NSDateComponents *nowComponents = [calendar components:unit fromDate:[NSDate date]];
//    
//    // 如果传入的日期 和当前的 日期的 年月日 相同,则是同一天
//    return selfComponents.year == nowComponents.year && selfComponents.month == nowComponents.month && selfComponents.day -1 == nowComponents.day;
//    
//    return NO;
//  
    // 生成只有年月日的日期对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    // 比较差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;


}

/**
 *  是否是明天
 */
- (BOOL)isTomorrow
{
//    // 通过日历对象获取当前的时间
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    // 取出日期组成部分包含哪些信息
//    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//    
//    // 获取调用日期的组成成分
//    NSDateComponents *selfComponents = [calendar components:unit fromDate:self];
//    // 获取当前日期的组成成分
//    NSDateComponents *nowComponents = [calendar components:unit fromDate:[NSDate date]];
//    
//    // 如果传入的日期 和当前的 日期的 年月日 相同,则是同一天
//    return selfComponents.year == nowComponents.year && selfComponents.month == nowComponents.month && selfComponents.day + 1 == nowComponents.day;
    
    
     // 生成只有年月日的日期对象
     NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
     fmt.dateFormat = @"yyyy-MM-dd";
     
     NSString *selfString = [fmt stringFromDate:self];
     NSDate *selfDate = [fmt dateFromString:selfString];
     
     NSString *nowString = [fmt stringFromDate:[NSDate date]];
     NSDate *nowDate = [fmt dateFromString:nowString];
     
     // 比较差距
     NSCalendar *calendar = [NSCalendar currentCalendar];
     NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
     NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
     
     return cmps.year == 0
     && cmps.month == 0
     && cmps.day == -1;
    
}

/**
 *  是否是今年
 */
- (BOOL)isThisYear
{
    // 通过日历对象获取当前的时间
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 取出日期组成部分包含哪些信息
    NSCalendarUnit unit = NSCalendarUnitYear ;
    
    // 获取调用日期的组成成分
    NSDateComponents *selfComponents = [calendar components:unit fromDate:self];
    // 获取当前日期的组成成分
    NSDateComponents *nowComponents = [calendar components:unit fromDate:[NSDate date]];
    
    // 如果传入的日期 和当前的 日期的 年月日 相同,则是同一天
    return selfComponents.year == nowComponents.year;
}

@end
