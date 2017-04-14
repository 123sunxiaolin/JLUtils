//
//  NSDate+JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 17/3/27.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "NSDate+JLUtils.h"

@implementation NSDate (JLUtils)

+ (NSString *)JL_CurrentTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:[[self class] date]];
}

+ (NSString *)JL_CurrentTimeAll{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmssSSS"];
    return [formatter stringFromDate:[[self class] date]];
}

- (NSString *)JL_dueDateTime{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:self];
    
}
- (NSString *)JL_unixTimeStamp{
    long long time = [self timeIntervalSince1970] * 1000;
    return [NSString stringWithFormat:@"%lld", time];
}

- (long long)JL_timeStamp{
    
    long long time = [self timeIntervalSince1970] * 1000;
    return time;
}

@end
