//
//  LQYSettingController.m
//  baisibudejie
//
//  Created by shasha on 15/10/21.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYSettingController.h"


@interface LQYSettingController ()

@end

@implementation LQYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    
    [self getCachesSize3];
    
}

/**
 *  获得缓存大小 :通过遍历文件夹中子文件来计算大小(比较傲准确)(与2的不同点在于,遍历方法不同)
 */
- (void)getCachesSize3
{
    // 获得 Library/Caches 文件夹
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    // 这个应用的缓存文件夹
    // SDWebImage 已经做好图片好缓存处理,在 caches 文件夹后边拼接了一个 default 文件件用来存储图片
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"default"];
    
    // 获得文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];

    // 缓存文件大小
    NSInteger sizefile = 0;
    
    // 遍历文件夹
    NSDirectoryEnumerator *enumerator = [manager enumeratorAtPath:filePath];
    for (NSString *subpath in enumerator) {
        // 完整的子路径
        NSString *completePath = [filePath stringByAppendingPathComponent:subpath];
        sizefile += [manager attributesOfItemAtPath:completePath error:nil].fileSize;
    }
    
    NSLog(@"%zd",sizefile);
    
}

/**
 *  获得缓存大小 :通过遍历文件夹中子文件来计算大小(比较傲准确)
 */
- (void)getCachesSize2
{
    // 获得 Library/Caches 文件夹
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    
    // 这个应用的缓存文件夹
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"default"];
    
    // 获得文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 缓存文件大小
    NSInteger sizefile = 0;
    
    // 遍历文件夹
    NSArray *subpaths = [manager subpathsAtPath:filePath];
    for (NSString *subpath in subpaths) {
        // 完整的子路径
        NSString *completePath = [filePath stringByAppendingPathComponent:subpath];
        sizefile += [manager attributesOfItemAtPath:completePath error:nil].fileSize;
    }
    
    NSLog(@"%zd",sizefile);
    
}


/**
 *  获得缓存大小 : 文件夹 没有准确的文件大小属性(文件夹也有大小)
 */
- (void)getCachesSize1
{
    /* 获取沙盒中文件夹的路径的方法
     1.获得Documents文件夹
     [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
     2.获得tmp文件夹
     NSTemporaryDirectory();
     
     3.获得Library/Caches文件夹
     NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
     
     沙盒中文件夹的层级
     
     1.Documents
     2.Library
        1. Caches  ->  default
        2.Cookies 
        3.Preferences
     3.tmp
    */
    // 获得 Library/Caches文件夹
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask ,YES) firstObject];
    
    // stringByAppendingPathComponent 比 stringByAppendingString 多生成一个 /
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"default"];
    
    // 获得文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 获得文件属性
    NSDictionary *attrs = [manager attributesOfItemAtPath:filePath error:nil];
    LQYLog(@"%zd",[attrs[NSFileSize] integerValue]);
    LQYLog(@"%@",attrs);

}

#pragma mark - Table view数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"清理缓存";
    return cell;
}

@end
