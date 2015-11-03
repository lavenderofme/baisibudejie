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

@property (nonatomic, assign) CGFloat height; /**< 显示中间图片的高 */
@property (nonatomic, assign) CGFloat width; /**< 显示中间图片的宽 */

@property (nonatomic, strong) NSString *small_image; /**< 返回小图片 */
@property (nonatomic, strong) NSString *middle_image; /**< 返回中图片 */
@property (nonatomic, strong) NSString * large_image; /**< 返回大图片 */
@property (nonatomic, assign) BOOL is_gif; /**< 是不是 gif 图片 */
@property (nonatomic, assign) NSInteger playcount; /**< 播放数量 */
@property (nonatomic, assign) NSInteger voicetime; /**< 声音文件的长度 */
@property (nonatomic, assign) NSInteger videotime; /**< 视频文件的长度 */

// 赋值属性
@property (nonatomic, assign, getter=isBigPicture) BOOL bigPicture; /**< 是不是大图 */
@property (nonatomic, assign) CGRect centerFrame; /**< 中间控件的尺寸 */
@property (nonatomic, assign) CGFloat cellHeight; /**< cell 的高度 */



@end
