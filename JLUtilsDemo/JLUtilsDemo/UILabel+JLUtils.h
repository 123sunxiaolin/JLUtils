//
//  UILabel+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface UILabel (JLUtils)
/**
 *  实例化UILabel对象
 *
 *  @param frame 位置
 *  @param backgroundColor 背景色
 *  @param font 字号
 *  @param textAlignment 对齐
 *  @param color 字体颜色
 *  @param highlightedColor 高亮字体颜色
 *
 *  @return 实例化的对象
 */
+ (UILabel *)JL_labelWithFrame:(CGRect)frame
               backgroundColor:(UIColor *)backgroundColor
                          font:(UIFont *)font
                 textAlignment:(NSTextAlignment)textAlignment
                     textColor:(UIColor *)color
          highlightedTextColor:(UIColor *)highlightedColor;

@end
