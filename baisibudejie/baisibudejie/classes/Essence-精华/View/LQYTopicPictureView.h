//
//  LQYTopicPictureView.h
//  baisibudejie
//
//  Created by shasha on 15/10/31.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LQYTopic;

@interface LQYTopicPictureView : UIView

@property (nonatomic, strong) LQYTopic *topic; /**< 传入模型 */

+ (instancetype)pictureView; /** 提供一个方法创建一个这种类型的图片view */
@end
