//
//  NSDictionary+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/26.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//
#import <Foundation/Foundation.h>

@interface NSDictionary (JLUtils)
/**
 *  转换成字符串
 *
 *  @return 转换后的字符串
 */
- (NSString *)JL_jsonString;
/**
 *  转换成json数据
 *
 *  @return json数据
 */
- (NSData *)JL_jsonData;
/**
 *  添加key对应的对象为空的处理
 *
 *  @param key 键
 *
 *  @return 对象
 */
- (id)JL_objectOrNilForKey:(id)key;
/**
 *  返回字符串类型的对象
 *
 *  @param key 键
 *
 *  @return 对应的字符串
 */
- (NSString *)JL_stringForKey:(id)key;
/**
 *  返回不为空的字符串对象
 *
 *  @param key 键
 *
 *  @return 字符串
 */
- (NSString *)JL_stringOrEmptyStringForKey:(id)key;
/**
 *  返回字典类型的对象
 *
 *  @param key 键
 *
 *  @return 字典
 */
- (NSDictionary *)JL_dictionaryForKey:(id)key;
/**
 *  返回数组类型的对象
 *
 *  @param key 键
 *
 *  @return 数组
 */
- (NSArray *)JL_arrayForKey:(id)key;
/**
 *  返回NSNumber类型的对象
 *
 *  @param key 键
 *
 *  @return NSNumber
 */
- (NSNumber *)JL_numberForKey:(id)key;
/**
 *  返回NSURL类型的对象
 *
 *  @param key 键
 *
 *  @return NSURL
 */
- (NSURL *)JL_urlForKey:(id)key;
/**
 *  返回bool类型
 *
 *  @param key 键
 *
 *  @return bool
 */
- (BOOL)JL_boolForKey:(id)key;
/**
 *  返回 ISO8601 格式字符串对应的日期
 *
 *  @param key 键
 *
 *  @return 日期对象
 */
- (NSDate *)JL_dateForKey:(id)key;
/**
 *  返回指定秒数对应的日期(since 1970)
 *
 *  @param key 键
 *
 *  @return 对应的日期
 */
- (NSDate *)JL_dateForKeySince1970:(id)key;
/**
 *  返回指定日期格式的NSDate对象
 *
 *  @param key          键
 *  @param formatString 日期格式
 *
 *  @return NSDate对象
 */
- (NSDate *)JL_dateForKey:(id)key withFormat:(NSString *)formatString;
@end
