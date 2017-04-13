//
//  NSMutableArray+JLUtils.m
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import "NSMutableArray+JLUtils.h"
#import "NSObject+JLUtils.h"

static const NSString *JL_defaultObject = @"JL_defaultObject";
@implementation NSMutableArray (JLUtils)

+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSArrayM") JL_swizzleMethod:
             @selector(objectAtIndex:) withMethod:@selector(run_objectAtIndex:) error:nil];
            [objc_getClass("__NSArrayM") JL_swizzleMethod:
             @selector(addObject:) withMethod:@selector(run_addObject:) error:nil];
        };
    });
}

-(void)run_addObject:(id)object {
    
    if (!object || [object isKindOfClass:[NSNull class]]) {
        [self run_addObject:JL_defaultObject];
    } else {
        [self run_addObject:object];
    }
    
}

- (id)run_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return[self run_objectAtIndex:index];
    }
    
    return nil;//越界直接返回nil
}

#pragma mark -- 自定义分类方法
- (id)JL_objectAtIndex:(NSUInteger)index{
    if (index < self.count)
    {
        return self[index];
    }
    else
    {
        return nil;
    }
}

-(void)JL_addObject:(id)object {
    
    if (!object || [object isKindOfClass:[NSNull class]]) {
        [self addObject:JL_defaultObject];
    } else {
        [self addObject:object];
    }
}
@end
