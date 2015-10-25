//
//  LQYRecommend.h
//  baisibudejie
//
//  Created by shasha on 15/10/24.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQYRecommend : NSObject
@property (nonatomic, strong) NSString *image_list; /**< 图片 */
@property (nonatomic, strong) NSString *theme_name; /**< 名字 */
@property (nonatomic, assign) NSInteger sub_number; /**< 订阅数 */
@end
