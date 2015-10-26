//
//  NSString+LQYExtension.m
//  baisibudejie
//
//  Created by shasha on 15/10/26.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "NSString+LQYExtension.h"

@implementation NSString (LQYExtension)

- (unsigned long long)fileSize
{
    // 获得文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 判断是不是文件夹
    BOOL isDirectory  = NO;
    
    // 判断路径是否存在
    BOOL exists = [manager fileExistsAtPath:self isDirectory:&isDirectory];
    // 路径不存在
    if (!exists) return 0;
    
    // 如果是文件件
    if (isDirectory) {
        // 文件总大小
        unsigned long long filesize = 0;
        // 遍历所以文件件
        NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            // 完整子路径
            NSString *completePath = [self stringByAppendingPathComponent:subpath];
            filesize += [manager attributesOfItemAtPath:completePath error:nil].fileSize;
        }
        return filesize;
    }
    
    return [manager attributesOfItemAtPath:self error:nil].fileSize;
}
@end
