//
//  UIView+JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JLUtils)
/**
 *  进行截图
 *
 *  @param scale     视图比例
 *  @param imageSize 生成截图的尺寸
 *
 *  @return 截图对象
 */
- (UIImage *)JL_screenShootWithScale:(CGFloat)scale targetImageSize:(CGSize)imageSize;

/*!
 *  @warning UIView在使用该方法前，需要设置Frame属性
 *
 *  @brief 设置视图自定义圆角（可任选视图的角设置成圆角）
 *
 *  @param corners     设置成圆角的组合（左上、左下、右上、右下，以按位或方式进行组合传递）
 *  @param cornerRadii 圆角的尺寸 (宽高需大于零)
 */
- (void)JL_setCustomCornersWithRoundingCorners:(UIRectCorner)corners
                                   cornerRadii:(CGSize)cornerRadii;
@end
