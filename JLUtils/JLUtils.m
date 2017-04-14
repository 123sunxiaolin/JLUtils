//
//  JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "JLUtils.h"
#import "AppDelegate.h"

@implementation JLUtils

+ (UIImage *)JL_screenImageWithSize:(CGSize)imageSize{
    
    UIGraphicsBeginImageContext(imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window.layer renderInContext:context];//使用当前窗口大小截屏
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)JL_screenImageWithView:(UIView *)targetView Size:(CGSize)imageSize isOpaque:(BOOL)isOpaque scale:(CGFloat)scale{
    
    CGSize targetSize = CGSizeMake(MAX(targetView.frame.size.width, imageSize.width), MAX(targetView.frame.size.height, imageSize.height));
    UIGraphicsBeginImageContextWithOptions(targetSize, isOpaque, scale);
    [targetView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
