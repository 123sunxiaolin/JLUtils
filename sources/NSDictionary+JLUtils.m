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

@end
