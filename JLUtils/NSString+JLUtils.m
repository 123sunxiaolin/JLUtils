
// NSString+JLUtils.m
//  JLUtils<https://github.com/123sunxiaolin/JLUtils>
//
//  Created by Jacklin on 2017/4/13.
//  Copyright © 2017年 com.jack.lin. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "NSString+JLUtils.h"

@implementation NSString (JLUtils)

- (CGSize)JL_sizeOfTextContentHeightWithFont:(UIFont *)wordFont givenSize:(CGSize)size{
    
    
    return [self JL_sizeOfTextContentWithFont:wordFont
                               paragraphStyle:nil
                                    givenSize:CGSizeMake(size.width, CGFLOAT_MAX)];
}

- (CGSize)JL_sizeOfTextContentWidthWithFont:(UIFont *)wordFont givenSize:(CGSize)size{
    
    return [self JL_sizeOfTextContentWithFont:wordFont
                               paragraphStyle:nil
                                    givenSize:CGSizeMake(CGFLOAT_MAX, size.height)];
    
}

- (CGSize)JL_sizeOfTextContentWithFont:(UIFont *)wordFont
                     paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
                          givenSize:(CGSize)size{
    
    if(self&&self.length>0)
    {
        NSMutableParagraphStyle *tempParagraphStyle;
        if (paragraphStyle == nil) {
            //没有设置段落样式，采取默认设置
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
            [paragraphStyle setLineSpacing:0];
            [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
            tempParagraphStyle = paragraphStyle;
            
        }else{
            tempParagraphStyle = paragraphStyle;
        }
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self];
        
        [str addAttribute:NSParagraphStyleAttributeName
                    value:tempParagraphStyle
                    range:NSMakeRange(0, [self length])];
        
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:@{NSParagraphStyleAttributeName:tempParagraphStyle, NSFontAttributeName:wordFont}
                                         context:nil];
        return rect.size;
    }
    else
    {
        return CGSizeZero;
    }
    
}



- (NSData *)JL_data{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary *)JL_dictionary{
    
    if (self == nil) {
        return nil;
    }
    
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[self JL_data]
                                                        options:NSJSONReadingAllowFragments
                                                          error:&error];
    if (error) {
        return nil;
    }
    return dic;
}

- (NSString *)JL_dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *tempDate = [formatter dateFromString:self];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter2 stringFromDate:tempDate];
}

- (NSDate *)JL_date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter dateFromString:self];
}
- (NSString *)JL_dateStringFromTimeStamp{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(long long)self];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    return [formatter stringFromDate:date];
    
}

- (NSDate *)JL_dateFromTimeStamp{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:(long long)self];
    return date;
}

@end
