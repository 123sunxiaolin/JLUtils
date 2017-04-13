//
//  NSDate+JLUtils.m
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
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
