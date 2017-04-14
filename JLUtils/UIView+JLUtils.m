//
//  UIView+JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "UIView+JLUtils.h"

@implementation UIView (JLUtils)
- (UIImage *)JL_screenShootWithScale:(CGFloat)scale targetImageSize:(CGSize)imageSize{
    
    CGSize targetSize = CGSizeMake(MAX(self.frame.size.width, imageSize.width), MAX(self.frame.size.height, imageSize.height));
    UIGraphicsBeginImageContextWithOptions(targetSize, self.opaque, scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)JL_setCustomCornersWithRoundingCorners:(UIRectCorner)corners
                                   cornerRadii:(CGSize)cornerRadii{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:corners
                                                         cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
}

@end
