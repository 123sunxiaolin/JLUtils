//
//  NSData+JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (JLUtils)
/**
 *  将数据转换成字典类型
 *
 *  @return 转换后的字典
 */
- (NSDictionary *)JL_toDictionary;
/**
 *  转换成字符串
 *
 *  @return 转换后的字符串
 */
- (NSString *)JL_string;

@end
