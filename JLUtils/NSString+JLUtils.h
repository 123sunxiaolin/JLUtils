//
//  NSString+JLUtils.h
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JLUtils)
#pragma mark - 字符串操作
/*!
 *  @brief 计算指定格式下的文字段落尺寸(宽度不变，高度自动计算)
 *
 *  @param wordFont 文字的字体
 *  @param size     指定的尺寸
 *
 *  @return 计算后的尺寸
 */
- (CGSize)JL_sizeOfTextContentHeightWithFont:(UIFont *)wordFont givenSize:(CGSize)size;
/*!
 *  @brief 计算指定格式下的文字段落尺寸(高度不变，宽度自动计算)
 *
 *  @param wordFont 文字的字体
 *  @param size      指定的尺寸
 *
 *  @return 计算后的尺寸
 */
- (CGSize)JL_sizeOfTextContentWidthWithFont:(UIFont *)wordFont givenSize:(CGSize)size;
/*!
 *  @brief 计算指定格式下的文字段落尺寸(宽高自定义)
 *
 *  @param wordFont       文字的字体
 *  @param paragraphStyle 段落的样式
 *  @param size           指定的尺寸
 *
 *  @return 计算后的尺寸
 */
- (CGSize)JL_sizeOfTextContentWithFont:(UIFont *)wordFont
                     paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
                          givenSize:(CGSize)size;

#pragma mark - 其他
/**
 *  将字符串转换成数据
 *
 *  @return 转换后的数据
 */
- (NSData *)JL_data;
/**
 *  将字符串转换成字符串
 *
 *  @return 返回转换后的字符串
 */
- (NSDictionary *)JL_dictionary;
/**
 *  将日期字符串为：2016-03-12 10:20:30转换为 20160312102030
 * //注：可以将此方法进行拓展，变换成满足项目需求的方法
 *  @return 转换后的字符串
 */
- (NSString *)JL_dateString;
/**
 *  将字符串转换成NSdate
 *  暂支持yyyy-MM-dd HH:mm:ss
 *  @return 转换后的日期
 */
- (NSDate *)JL_date;
/**
 *  将时间戳转换为字符串
 *
 *  @return 转换后的字符串:yyyyMMddHHmmss
 */
- (NSString *)JL_dateStringFromTimeStamp;
/**
 *  将时间戳转换为日期对象
 *
 *  @return 转换后的日期对象
 */
- (NSDate *)JL_dateFromTimeStamp;
@end
