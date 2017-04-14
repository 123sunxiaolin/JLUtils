//  NSMutableArray+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
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
