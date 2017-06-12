//
//  UIButton+InsensitiveTouch.m
//  JLUtilsDemo
//
//  Created by perfect on 2017/6/12.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "UIButton+InsensitiveTouch.h"
#import <objc/runtime.h>

//最小时间差
static NSTimeInterval insensitiveMinTimeInterval = 0.5;
//原生sendAction:to:forEvent:实现
static void (*originalImplementation)(id, SEL, SEL, id, UIEvent *) = NULL;
//替换的sendAction:to:forEvent:实现
static void replacedImplementation(id object, SEL selector, SEL action, id target, UIEvent *event);

@implementation UIButton (InsensitiveTouch)

+ (void)enableInsensitiveTouch {
    //获取当前"@selector(sendAction:to:forEvent:)"对应的Method
    Method methodNow = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    //得到当前sendAction:to:forEvent:实现地址
    IMP implementationNow = method_getImplementation(methodNow);
    //这个实现地址已经是replacedImplementation,说明已经替换过了
    if (implementationNow == (IMP)replacedImplementation) {
        return;
    }
    //保存原生的sendAction:to:forEvent:实现地址
    originalImplementation = (void (*)(id, SEL, SEL, id, UIEvent *))implementationNow;
    const char *type = method_getTypeEncoding(methodNow);
    //将实现替换为replacedImplementation
    class_replaceMethod(self, @selector(sendAction:to:forEvent:), (IMP)replacedImplementation, type);
}

+ (void)disableInsensitiveTouch{
    
    IMP implementationNow = class_getMethodImplementation(self, @selector(sendAction:to:from:forEvent:));
    if (originalImplementation && implementationNow == (IMP)replacedImplementation) {
        class_replaceMethod(self, @selector(sendAction:to:forEvent:), (IMP)originalImplementation, NULL);
    }
}

+ (void)setInsensitiveMinTimeInterval:(NSTimeInterval)interval {
    insensitiveMinTimeInterval = interval;
}

- (NSTimeInterval)lastTouchTimestamp{
    return [objc_getAssociatedObject(self, @selector(lastTouchTimestamp)) doubleValue];
}

- (void)setLastTouchTimestamp:(NSTimeInterval)timestamp {
    objc_setAssociatedObject(self, @selector(lastTouchTimestamp), @(timestamp), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

//替换的sendAction:to:forEvent:实现
static void replacedImplementation(id object, SEL selector, SEL action, id target, UIEvent *event) {
    //是按钮，并且是UIEventTypeTouches事件，才进行时间戳判断
    //但是要排除这两种按钮 “CUShutterButton”和 "CAMShutterButton"，这两个分别是8系统，10系统上相机拍照按钮的类名.这是两个特殊封装过的按钮，如果把它们的事件也用时间戳给过滤掉了，你就会发现app里弹出相机后，要长按才能拍照。
    if ([object isKindOfClass:UIButton.self]
        && ![NSStringFromClass([object class]) isEqualToString:@"CUShutterButton"]
        && ![NSStringFromClass([object class]) isEqualToString:@"CAMShutterButton"]
        && event.type == UIEventTypeTouches) {
        //进行时间戳判断
        UIButton *button = (UIButton *)object;
        if (ABS(event.timestamp - button.lastTouchTimestamp) < insensitiveMinTimeInterval) {
            //时间过短，就此返回，此次事件Send也中止
            return;
        }
        button.lastTouchTimestamp = event.timestamp;
    }
    //时间戳上没问题，不属于快速点击
    if (originalImplementation) {
        //调用系统原生实现，继续完成事件的Send
        originalImplementation(object, selector, action, target, event);
    }
}
