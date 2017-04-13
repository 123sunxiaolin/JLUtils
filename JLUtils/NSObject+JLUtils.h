//
//  NSObject+JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (JLUtils)

/*!
 *  @brief 对系统方法进行替换
 *
 *  @param originalSelector 原来的系统方法
 *  @param swizzledSelector 替换的方法
 *  @param error            替换过程中出现的问题
 *
 *  @return 替换是否成功
 */
+ (BOOL)JL_swizzleMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector error:(NSError **)error;
@end
