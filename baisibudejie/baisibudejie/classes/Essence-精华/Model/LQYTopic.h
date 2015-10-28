//
//  LQYTopic.h
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQYTopic : NSObject

@property (nonatomic, copy) NSString *profile_image; /**< 头像 URL */

@property (nonatomic, copy) NSString *text; /**< 帖子的内容 */

@property (nonatomic, copy) NSString *name; /**< 发帖人的昵称 */

@property (nonatomic, strong) NSString *created_at ; /**< 帖子创建时间 */

@property (nonatomic, assign) NSInteger cai; /**< 踩 */
@property (nonatomic, assign) NSInteger ding; /**< 顶 */
@property (nonatomic, assign) NSInteger repost; /**< 分享/转发 */
@property (nonatomic, assign) NSInteger comment; /**< 评论 */


@end
