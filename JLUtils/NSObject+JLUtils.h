//  NSObject+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
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
