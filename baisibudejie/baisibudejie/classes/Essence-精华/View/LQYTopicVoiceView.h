//
//  LQYTopicVoiceView.h
//  baisibudejie
//
//  Created by shasha on 15/11/3.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LQYTopic;

@interface LQYTopicVoiceView : UIView

@property (nonatomic, strong) LQYTopic *topic; /**< 模型数据 */

+ (instancetype)voiceView;
@end
