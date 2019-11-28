//
//  UIButton+JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//
#import "UIButton+JLUtils.h"
//判断一个对象是否为空
#define JL_CHECK_NIL(_object) \
(_object == nil || [_object isKindOfClass:[NSNull class]])

//判断一个对象是否属于指定类型
#define JL_CHECK_CLASS(_object, _class) \
(!JL_CHECK_NIL(_object) \
&& [_object isKindOfClass:[_class class]])

@implementation UIButton (JLUtils)
- (void)JL_setTitleColor:(UIColor *)color{
    
    [self JL_setTitleColor:color selectedColor:color];
}

- (void)JL_setTitleColor:(UIColor *)color
           selectedColor:(UIColor *)selectedColor{
    
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:selectedColor forState:UIControlStateDisabled];
    [self setTitleColor:selectedColor forState:UIControlStateHighlighted];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}

- (void)JL_setTitle:(NSString *)title{
    [self JL_setTitle:title selectedTitle:title];
}

- (void)JL_setTitle:(NSString *)title
      selectedTitle:(NSString *)selectedTitle{
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

- (void)JL_addTarget:(id)target action:(SEL)action{
    [self addTarget:target
             action:action
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)JL_removeTarget:(id)target action:(SEL)action{
    [self removeTarget:target
                action:action
      forControlEvents:UIControlEventTouchUpInside];
}

- (void)JL_setImageWithName:(NSString *)name{
    [self setImage:[self p_packupImageWithName:name]
          forState:UIControlStateNormal];
}

- (void)JL_setSelectedImageWithName:(NSString *)selectedName{
    [self setImage:[self p_packupImageWithName:selectedName]
          forState:UIControlStateSelected];
}

- (void)JL_setHighlightedImageWithName:(NSString *)highlightedName{
    [self setImage:[self p_packupImageWithName:highlightedName]
          forState:UIControlStateHighlighted];
}

- (void)JL_setBackgroundWithImageName:(NSString *)name{
    [self JL_setBackgroundWithImageName:name
                           capInsets:UIEdgeInsetsZero];
}

- (void)JL_setBackgroundWithImageName:(NSString *)name
                    selectedImageName:(NSString *)selectedImageName{
    [self JL_setBackgroundWithImageName:name
                   selectedImageName:selectedImageName
                highlightedImageName:nil
                   disabledImageName:nil
                           capInsets:UIEdgeInsetsZero];
}

- (void)JL_setBackgroundWithImageName:(NSString *)name
                            capInsets:(UIEdgeInsets)insets{
    
    UIImage *normalImage = [self p_packupImageWithName:name];
    if (!UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsetsZero)) {
        [normalImage resizableImageWithCapInsets:insets];
    }
    [self setBackgroundImage:normalImage
                    forState:UIControlStateNormal];
}

- (void)JL_setBackgroundWithImageName:(NSString *)name
                    selectedImageName:(NSString *)selectedImageName
                            capInsets:(UIEdgeInsets)insets{
    
    [self JL_setBackgroundWithImageName:name
                   selectedImageName:selectedImageName
                highlightedImageName:nil
                   disabledImageName:nil
                           capInsets:insets];
    
}

- (void)JL_setBackgroundWithImageName:(NSString *)imageName
                    selectedImageName:(NSString *)selectedImageName
                 highlightedImageName:(NSString *)highlightedImageName
                    disabledImageName:(NSString *)disabledImageName
                            capInsets:(UIEdgeInsets)insets{
    UIImage *normalImage = [self p_packupImageWithName:imageName];
    UIImage *selectedImage = [self p_packupImageWithName:selectedImageName];
    UIImage *highlightedImage = [self p_packupImageWithName:highlightedImageName];
    UIImage *disabledImage = [self p_packupImageWithName:disabledImageName];
    
    if (!UIEdgeInsetsEqualToEdgeInsets(insets, UIEdgeInsetsZero)) {
        [normalImage resizableImageWithCapInsets:insets];
        [selectedImage resizableImageWithCapInsets:insets];
        [highlightedImage resizableImageWithCapInsets:insets];
        [disabledImage resizableImageWithCapInsets:insets];
    }
    
    if (!selectedImage) {
        selectedImage = normalImage;
    }
    
    if (!highlightedImage) {
        highlightedImage = normalImage;
    }
    
    if (!disabledImage) {
        disabledImage = normalImage;
    }
    
    [self setBackgroundImage:normalImage
                    forState:UIControlStateNormal];
    [self setBackgroundImage:selectedImage
                    forState:UIControlStateSelected];
    [self setBackgroundImage:highlightedImage
                    forState:UIControlStateHighlighted];
    [self setBackgroundImage:disabledImage
                    forState:UIControlStateDisabled];
    
}

- (void)JL_enableHighlightedForSubView{
    [self addTarget:self
             action:@selector(onTouchForSelection:)
   forControlEvents:UIControlEventTouchDown];
    [self addTarget:self
             action:@selector(onTouchForDeselect:)
   forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self
             action:@selector(onTouchForSelection:)
   forControlEvents:UIControlEventTouchDragEnter];
    [self addTarget:self
             action:@selector(onTouchForDeselect:)
   forControlEvents:UIControlEventTouchDragExit];
}

-(UIFont *)JL_titleFont{
    return self.titleLabel.font;
}

- (void)setJL_titleFont:(UIFont *)JL_titleFont{
    self.titleLabel.font = JL_titleFont;
}

#pragma mark - Private
- (UIImage *)p_packupImageWithName:(NSString *)name{
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)onTouchForSelection:(id)sender
{
    [self p_setHighlightedForSubView:YES];
}

- (void)onTouchForDeselect:(id)sender
{
    [self p_setHighlightedForSubView:NO];
}

- (void)p_setHighlightedForSubView:(BOOL)highlighted
{
    for (UIView *view in self.subviews) {
        if (JL_CHECK_CLASS(view, UILabel)) {
            UILabel *label = (UILabel *)view;
            label.highlighted = highlighted;
        } else if (JL_CHECK_CLASS(view, UIImageView)) {
            UIImageView *imageView = (UIImageView *)view;
            imageView.highlighted = highlighted;
        }
    }
}
@end

#pragma mark - AdjustImageAndTitle
@implementation UIButton (JLImagePosition)

- (void)JL_setImagePosition:(JLImagePosition)postion spacing:(CGFloat)spacing {
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];

    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + spacing - tempHeight;
    
    switch (postion) {
        case JLImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case JLImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + spacing/2), 0, imageWidth + spacing/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, spacing/2);
            break;
            
        case JLImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            //文字左偏1单位 手动设置右偏1单位
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX + 1, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case JLImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            break;
    }
    
}


@end
