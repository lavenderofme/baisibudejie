//
//  LQYExtensionConfig.m
//  baisibudejie
//
//  Created by shasha on 15/10/31.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import "LQYExtensionConfig.h"
#import <MJExtension.h>
#import "LQYTopic.h"
#import "LQYComment.h"

@implementation LQYExtensionConfig

+ (void)load
{
    [LQYTopic setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"topCmt" : @"top_cmt[0]",
                 @"small_image" : @"image0",
                 @"middle_image" : @"image2",
                 @"large_image" : @"image1"};
    }];
}

@end
