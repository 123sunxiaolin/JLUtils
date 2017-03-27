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

- (void)testObjectOrNilForKey{
    UIView *testView = [[UIView alloc] init];
    NSDictionary *dic = @{@"mainView": testView};
    id object = [dic JL_objectOrNilForKey:@"mainView"];
    XCTAssertEqual(testView, object);
}

- (void)testStringForKey{
    NSDictionary *dic = @{@"name":@"Jack_lin", @"age":@""};
    XCTAssertEqual(@"Jack_lin", [dic JL_stringForKey:@"name"]);
    XCTAssertNil([dic JL_stringForKey:@"age"]);
}

- (void)testStringOrEmptyStringForKey{
    NSDictionary *dic = @{@"name":@"Jack_lin", @"age":@""};
    NSString *str = [dic JL_stringOrEmptyStringForKey:@"age1"];
    XCTAssertNotNil([dic JL_stringOrEmptyStringForKey:@"age1"]);
}

- (void)testDictionaryForKey{
    NSDictionary *dic = @{
                          @"info":@{@"name":@"Jack_lin", @"age":@"25"}};
    id object = [dic JL_dictionaryForKey:@"info"];
    NSDictionary *testDic = @{@"name":@"Jack_lin", @"age":@"25"};
    XCTAssertEqualObjects(object, testDic);
}

- (void)testArrayForKey{
    NSDictionary *dic = @{
                          @"info":@[@1, @2, @3]};
    id object = [dic JL_arrayForKey:@"info"];
    NSArray *array = [NSArray arrayWithObjects:@1, @2, @3, nil];
    XCTAssertEqualObjects(object, array);
}

- (void)testNumberForKey{
    NSDictionary *dic = @{
                          @"info":@1};
    id object = [dic JL_numberForKey:@"info"];
    NSNumber *number = [NSNumber numberWithInteger:1];
    XCTAssertEqualObjects(object, number);
}

- (void)testDateForKey{
    NSDictionary *dic = @{@"date":@"2017-03-27T03:00:00Z"};
    id date = [dic JL_dateForKey:@"date"];
    XCTAssertNotNil(date);

    
}

@end
