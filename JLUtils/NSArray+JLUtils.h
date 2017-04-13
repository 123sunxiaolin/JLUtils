//
//  NSArray+JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JLUtils)

/**
 防止数组溢出

 @param index 元素索引
 @return 对象
 */
- (id)JL_objectAtIndex:(NSUInteger)index;

@end
