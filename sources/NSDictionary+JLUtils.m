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

#import "NSDictionary+JLUtils.h"

@implementation NSDictionary (JLUtils)
- (NSString *)JL_jsonString{
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error) {
        
        return nil;
        
    }
    return [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
    
}

- (NSData *)JL_jsonData{
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error) {
        
        return nil;
        
    }
    return jsonData;
}

- (id)JL_objectOrNilForKey:(id)key{
    id object = [self objectForKey:key];
    if (object == [NSNull null]) {
        return nil;
    }
    return object;
}

- (NSString *)JL_stringForKey:(id)key{
    NSString *string = [self JL_objectOrNilForKey:key];
    if ([string isKindOfClass:[NSString class]]  && (string.length > 0)) {
        return string;
    }
    return nil;
}

- (NSString *)JL_stringOrEmptyStringForKey:(id)key{
    NSString *string = [self JL_stringForKey:key];
    if (!string) return @"";
    return string;
}

- (NSDictionary *)JL_dictionaryForKey:(id)key{
    NSDictionary *dictionary = [self JL_objectOrNilForKey:key];
    if ([dictionary isKindOfClass:[NSDictionary class]] && [dictionary allKeys].count > 0) {
        return dictionary;
    }
    return nil;
}

- (NSArray *)JL_arrayForKey:(id)key{
    NSArray *array = [self JL_objectOrNilForKey:key];
    if ([array isKindOfClass:[NSArray class]] && array.count > 0) {
        return array;
    }
    return nil;
}

- (NSNumber *)JL_numberForKey:(id)key{
    NSNumber *number = [self JL_objectOrNilForKey:key];
    if ([number isKindOfClass:[NSNumber class]]) {
        return number;
    }
    return nil;
}

- (NSURL *)JL_urlForKey:(id)key{
    return [NSURL URLWithString:[self JL_stringForKey:key]];
}

- (BOOL)JL_boolForKey:(id)key{
    return [[self JL_stringForKey:key] boolValue];
}

- (NSDate *)JL_dateForKey:(id)key{
    NSString *string = [self JL_stringForKey:key];
    if (!string) return nil ;
    
    if ([string hasPrefix:@"Z"]) {
        string = [[string substringToIndex:string.length - 1] stringByAppendingString:@"-0000"];
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

- (NSDate *)JL_dateForKeySince1970:(id)key{
    NSNumber *number = [self JL_numberForKey:key];
    if (!number) return nil;
    NSTimeInterval timeInterval = [number doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}

- (NSDate *)JL_dateForKey:(id)key withFormat:(NSString *)formatString{
    NSString *string = [self JL_stringForKey:key];
    if (!string) return nil;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

@end
