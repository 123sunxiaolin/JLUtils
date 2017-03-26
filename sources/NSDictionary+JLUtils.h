//
//  NSDictionary+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Sunxiaolin on 17/3/26.
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

@end
