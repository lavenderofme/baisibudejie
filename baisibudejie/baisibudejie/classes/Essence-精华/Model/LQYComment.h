//
//  LQYTopComment.h
//  baisibudejie
//
//  Created by shasha on 15/10/31.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LQYUser;

@interface LQYComment : NSObject

@property (nonatomic, strong) NSString *content; /**< 最热评论的内容 */
@property (nonatomic, strong) LQYUser *user; /**< 最热评论的用户信息 */
@end
