//
//  LQYClearCachesCell.m
//  baisibudejie
//
//  Created by shasha on 15/10/26.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYClearCachesCell.h"
#import <SVProgressHUD.h>

#define LQYCachesPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"default"]
@implementation LQYClearCachesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化文字
        self.textLabel.text = @"清理缓存";
        
        // 在计算缓存的时候不可点击,不可与用户交互
        self.userInteractionEnabled = NO;
       
        // 左边显示圈圈
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        
        // 在子线程中计算缓存大小
        [[[NSOperationQueue alloc]init] addOperationWithBlock:^{
            // 睡 5 秒
            [NSThread sleepForTimeInterval:5.0];
            // 单位
            double unit = 1000;
            // 文件的缓存大小
            unsigned long long filesize = LQYCachesPath.fileSize;
            // 标签文字
            NSString *fileText = nil;
            if (filesize >= pow(unit, 3)) {
                fileText = [NSString stringWithFormat:@"%.2fGB",filesize / pow(unit, 3)];
            }else if (filesize >= pow(unit, 2)){
                fileText = [NSString stringWithFormat:@"%.2fMB",filesize / pow(unit, 2)];
            }else if (filesize >= unit){
                fileText = [NSString stringWithFormat:@"%.2fKB",filesize / unit];
            }else{
                fileText = [NSString stringWithFormat:@"%zdB",filesize];
            }
            
            NSString *textLabel = [NSString stringWithFormat:@"清理缓存(%@)",fileText];
            // 回到主线程更新UI
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.textLabel.text = textLabel;
                
                // 去掉圈圈
                self.accessoryView = nil;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 尖尖样式
                
                // 恢复点击
                self.userInteractionEnabled = YES;
            }];
        }];
        
        // 给 cell 添加手势监听 cell的点击
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clearCache)]];
    }
    return self;
}

/**
 *  清除缓存
 */
- (void)clearCache
{
    // 代表正在清理缓存
    if (self.accessoryView) return;
    
    // 弹框
    [SVProgressHUD showInfoWithStatus:@"正在清理缓存..." maskType:SVProgressHUDMaskTypeBlack];
    // 在子线程中进行删除操作
    [[[NSOperationQueue alloc]init] addOperationWithBlock:^{
        
        // 删除缓存文件夹
        [[NSFileManager defaultManager] removeItemAtPath:LQYCachesPath error:nil];
        
        // 在主线程中更新 UI,隐藏弹出的框
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 隐藏弹框
            [SVProgressHUD dismiss];
            // 修改文字
            self.textLabel.text = @"清理缓存(0B)";
            
        }];
    }];
}
/**
 * 1.当控件显示到屏幕上时会调用一次layoutSubviews
 * 2.当控件的尺寸发生改变的时候会调用一次layoutSubviews
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 当cell离开屏幕时, UIActivityIndicatorView的动画就会被自动停止
    
    // 当cell重新显示到屏幕上时, 应该重新开始UIActivityIndicatorView的动画
    UIActivityIndicatorView *loadingView = (UIActivityIndicatorView *)self.accessoryView;
    [loadingView startAnimating];
}

@end
