//
//  NSDate+LQYExtension.h
//  baisibudejie
//
//  Created by shasha on 15/10/29.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LQYExtension)

/**
 *  是否是今天
*/
- (BOOL)isToday;

/**
 *  是否是昨天
 */
- (BOOL)isYesterday;

/**
 *  是否是明天
 */
- (BOOL)isTomorrow;

/**
 *  是否是今年
 */
- (BOOL)isThisYear;

@end
