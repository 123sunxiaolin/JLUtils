//  NSArray+JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "NSArray+JLUtils.h"
#import "NSObject+JLUtils.h"

@implementation NSArray (JLUtils)
/*!
 *  @brief runTime实现替换方法，避免数组越界
 */
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSArrayI") JL_swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(run_objectAtIndex:) error:nil];
        }
    });
}

- (id)run_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return[self run_objectAtIndex:index];
    }
    
    return nil;//越界直接返回nil
}

#pragma mark - 自定义的分类的方法
- (id)JL_objectAtIndex:(NSUInteger)index{
    
    if (index < self.count)
    {
        return self[index];
        
    }else{
        
        return nil;
    }
}

@end
