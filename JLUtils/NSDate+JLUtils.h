//
//  NSDate+JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (JLUtils)

/**
 *  获取当前时间：yyyyMMddHHmmss
 *
 *  @return 时间字符串
 */
+ (NSString *)JL_CurrentTime;
/**
 *  获取当前时间：yyyyMMddHHmmssSSS
 *
 *  @return 时间字符串
 */
+ (NSString *)JL_CurrentTimeAll;
/**
 *  获取指定日期的字符串：：yyyyMMddHHmmss
 *
 *  @return 时间字符串
 */
- (NSString *)JL_dueDateTime;
/**
 *  获取指定日期的Unix时间戳
 *
 *  @return 时间戳字符串
 */
- (NSString *)JL_unixTimeStamp;
/**
 *  返回数字类型的时间戳
 *
 *  @return 时间戳
 */
- (long long)JL_timeStamp;

@end
