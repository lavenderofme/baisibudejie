//
//  LQYTopic.h
//  baisibudejie
//
//  Created by shasha on 15/10/28.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LQYComment;

typedef enum{
    // 1为全部，10为图片，29为段子，31为音频，41为视频
    
    // 全部
    LQYTopicTypeAll = 1,
    // 图片
    LQYTopicTypePicture= 10,
    // 段子
    LQYTopicTypeWord = 29,
    // 音频
    LQYTopicTypeVoice = 31,
    // 视频
    LQYTopicTypeVideo = 41  
}LQYTopicType;

@interface LQYTopic : NSObject

@property (nonatomic, copy) NSString *profile_image; /**< 头像 URL */

@property (nonatomic, copy) NSString *text; /**< 帖子的内容 */

@property (nonatomic, copy) NSString *name; /**< 发帖人的昵称 */

@property (nonatomic, strong) NSString *created_at ; /**< 帖子创建时间 */

@property (nonatomic, assign) NSInteger cai; /**< 踩 */
@property (nonatomic, assign) NSInteger ding; /**< 顶 */
@property (nonatomic, assign) NSInteger repost; /**< 分享/转发 */
@property (nonatomic, assign) NSInteger comment; /**< 评论 */

@property (nonatomic, assign) LQYTopicType type; /**< 帖子的类型 */

@property (nonatomic, strong) LQYComment *topCmt; /**< 最热评论 */




@end
