//
//  NSData+JLUtils.h
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
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
