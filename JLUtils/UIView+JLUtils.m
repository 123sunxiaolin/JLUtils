//
//  UIView+JLUtils.m
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
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
