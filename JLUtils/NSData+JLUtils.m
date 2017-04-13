//
//  NSData+JLUtils.m
//  JLUtilsDemo
//
//  Created by perfect on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
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
