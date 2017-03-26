//
//  JLUtilsTest.m
//  JLUtilsDemo
//
//  Created by Sunxiaolin on 17/3/26.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+JLUtils.h"

@interface JLUtilsTest : XCTestCase

@end

@implementation JLUtilsTest

- (void)testConvertToString{
    NSDictionary *dic = @{@"name": @"Jack_lin", @"CNPL":@"iOSDevSkills"};
    NSString *jsonString = [dic JL_jsonString];
    NSLog(@"%@", jsonString);
    XCTAssertNotNil(jsonString);
}

- (void)testConvertToData{
    NSDictionary *dic = @{@"name": @"Jack_lin", @"CNPL":@"iOSDevSkills"};
    NSData *data = [dic JL_jsonData];
    XCTAssertNotNil(data);
}
@end
