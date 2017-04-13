//
//  NSMutableArray+JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (JLUtils)
/*!
 *  @brief 添加分类的方法，实现添加对象为空的判断
 */
- (id)JL_objectAtIndex:(NSUInteger)index;

/**
 添加对象的方法

 @param object 元素
 */
-(void)JL_addObject:(id)object;
@end
