//
//  LQYTopicVideoView.h
//  baisibudejie
//
//  Created by shasha on 15/11/3.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LQYTopic;

@interface LQYTopicVideoView : UIView

@property (nonatomic, strong) LQYTopic *topic; /**< 模型 */

+ (instancetype)videoView;
@end
