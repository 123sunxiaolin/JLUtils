//
//  UILabel+JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "UILabel+JLUtils.h"

@implementation UILabel (JLUtils)
+ (UILabel *)JL_labelWithFrame:(CGRect)frame
               backgroundColor:(UIColor *)backgroundColor
                          font:(UIFont *)font
                 textAlignment:(NSTextAlignment)textAlignment
                     textColor:(UIColor *)color
          highlightedTextColor:(UIColor *)highlightedColor{
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = backgroundColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.textColor = color;
    if (!highlightedColor) {
        highlightedColor = [UIColor whiteColor];
    }
    label.highlightedTextColor = highlightedColor;
    return label;
    
}
@end
