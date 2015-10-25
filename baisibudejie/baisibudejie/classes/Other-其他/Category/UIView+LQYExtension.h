//
//  UIView+LQYExtension.h
//  baisibudejie
//
//  Created by shasha on 15/10/24.
//  Copyright © 2015年 shasha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LQYExtension)
@property (nonatomic, assign) CGFloat x; /**< 控件的 x 值 */
@property (nonatomic, assign) CGFloat y; /**< 控件的 y 值 */
@property (nonatomic, assign) CGFloat width; /**< 控件的宽 */
@property (nonatomic, assign) CGFloat height; /**< 控件的高 */

@property (nonatomic, assign) CGFloat left; /**< 控件的 最左边 x*/
@property (nonatomic, assign) CGFloat right; /**< 控件的 最右边(最大 x值) */
@property (nonatomic, assign) CGFloat top; /**< 控件的 最上边 y */
@property (nonatomic, assign) CGFloat bottom; /**< 控件的 最下变(最大 x值) */

@property (nonatomic, assign) CGFloat centerX; /**< 控件中心点的 X */
@property (nonatomic, assign) CGFloat centerY; /**< 控件中心点的 Y */


@end
