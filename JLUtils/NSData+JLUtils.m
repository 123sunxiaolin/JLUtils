//
//  NSData+JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "NSData+JLUtils.h"

@implementation NSData (JLUtils)

- (NSDictionary *)JL_toDictionary{
    
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self
                                                        options:NSJSONReadingAllowFragments
                                                          error:&error];
    if (error) {
        return nil;
    }else{
        return dic;
    }
}

- (NSString *)JL_string{
    
    return [[NSString alloc] initWithData:self
                                 encoding:NSUTF8StringEncoding];
}

@end
