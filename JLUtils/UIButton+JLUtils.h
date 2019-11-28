//
//  UIButton+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

@interface UIButton (JLUtils)
/**
 *  设置按钮标题颜色
 *
 *  @param color 颜色对象
 */
- (void)JL_setTitleColor:(UIColor *)color;
/**
 *  设置按钮标题颜色
 *
 *  @param color          颜色对象
 *  @param selectedColor 点击后的颜色对象
 */
- (void)JL_setTitleColor:(UIColor *)color
           selectedColor:(UIColor *)selectedColor;
/**
 *  设置按钮的标题
 *
 *  @param title 标题
 */
- (void)JL_setTitle:(NSString *)title;
/**
 *  设置按钮的标题
 *
 *  @param title         标题
 *  @param selectedTitle 点击后的标题
 */
- (void)JL_setTitle:(NSString *)title
      selectedTitle:(NSString *)selectedTitle;

/**
 *  设置点击事件
 *
 *  @param target target
 *  @param action action
 */
- (void)JL_addTarget:(id)target action:(SEL)action;
/**
 *  移除点击事件
 *
 *  @param target target
 *  @param action action
 */
- (void)JL_removeTarget:(id)target action:(SEL)action;

/**
 设置按钮的图片
 
 @param name 图片名字
 */
- (void)JL_setImageWithName:(NSString *)name;

/**
 设置按钮被点击的图片
 
 @param selectedName 图片名字
 */
- (void)JL_setSelectedImageWithName:(NSString *)selectedName;

/**
 设置按钮高亮的图片
 
 @param highlightedName 高亮图片名字
 */
- (void)JL_setHighlightedImageWithName:(NSString *)highlightedName;

/**
 设置背景图片
 
 @param name 背景图片
 */
- (void)JL_setBackgroundWithImageName:(NSString *)name;

/**
 设置背景图片
 
 @param name 背景图片
 @param selectedImageName 被选背景图片
 */
- (void)JL_setBackgroundWithImageName:(NSString *)name
                    selectedImageName:(NSString *)selectedImageName;

/**
 设置背景图片
 
 @param name 背景图片
 @param insets 偏移量
 */
- (void)JL_setBackgroundWithImageName:(NSString *)name
                            capInsets:(UIEdgeInsets)insets;
/**
 设置背景图片
 
 @param name 背景图片
 @param selectedImageName 被选背景图片
 @param insets 偏移量
 */
- (void)JL_setBackgroundWithImageName:(NSString *)name
                    selectedImageName:(NSString *)selectedImageName
                            capInsets:(UIEdgeInsets)insets;

/**
 设置背景图片
 
 @param imageName 正常背景图片
 @param selectedImageName 被选背景图片
 @param highlightedImageName 高亮背景图片
 @param disabledImageName 失效背景图片
 @param insets 偏移量
 */
- (void)JL_setBackgroundWithImageName:(NSString *)imageName
                    selectedImageName:(NSString *)selectedImageName
                 highlightedImageName:(NSString *)highlightedImageName
                    disabledImageName:(NSString *)disabledImageName
                            capInsets:(UIEdgeInsets)insets;
/**
 设置子视图高亮显示
 */
- (void)JL_enableHighlightedForSubView;

@property (nonatomic, strong) UIFont *JL_titleFont;

@end

#pragma mark - AdjustImageAndTitle

typedef NS_ENUM(NSInteger, JLImagePosition) {
    JLImagePositionLeft = 0,              //图片在左，文字在右，默认
    JLImagePositionRight = 1,             //图片在右，文字在左
    JLImagePositionTop = 2,               //图片在上，文字在下
    JLImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (JLImagePosition)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)JL_setImagePosition:(JLImagePosition)postion spacing:(CGFloat)spacing;

@end
