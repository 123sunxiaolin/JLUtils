//
//  UIButton+InsensitiveTouch.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/6/12.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (InsensitiveTouch)

//开启UIButton防连点模式
+ (void)enableInsensitiveTouch;

//关闭UIButton防连点模式
+ (void)disableInsensitiveTouch;

//设置防连续点击最小时间差(s),不设置则默认值是0.5s
+ (void)setInsensitiveMinTimeInterval:(NSTimeInterval)interval;

@end
