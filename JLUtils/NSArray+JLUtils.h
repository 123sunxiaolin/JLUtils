//
//  NSArray+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
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
