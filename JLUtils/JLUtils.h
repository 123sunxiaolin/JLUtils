//
//  JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  通用工具类
 */
@interface JLUtils : NSObject
/**
 *  获取当前屏幕的截图，包含整个屏幕
 *
 *  @param imageSize 生成截图的尺寸
 *
 *  @return 截图对象
 */
+ (UIImage *)JL_screenImageWithSize:(CGSize)imageSize;
/**
 *  获取当前屏幕的截图，包含整个屏幕
 *  @param targetView 需要渲染的视图
 *  @param imageSize 生成截图的尺寸
 *  @param isOpaque  是否透明
 *  @param scale     图片缩放比例
 *
 *  @return 截图对象
 */
+ (UIImage *)JL_screenImageWithView:(UIView *)targetView Size:(CGSize)imageSize isOpaque:(BOOL)isOpaque scale:(CGFloat)scale;

@end
