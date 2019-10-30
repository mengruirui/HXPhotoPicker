//
//  UIColor+Extension.m
//
//  Created by 孟瑞瑞 on 15/9/18.
//  Copyright (c) 2018年 CSDN. All rights reserved.
//

#import "UIColor+HXExtension.h"

@implementation UIColor (HXExtension)
+(UIColor *)colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha
{
    if (@available(iOS 10.0, *))
    {
        return [UIColor colorWithDisplayP3Red:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
    }
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

+(UIColor *)colorWithHex:(long)hex andAlpha:(CGFloat)alpha
{
    //
    float red = ((float)((hex & 0xFF0000)>>16))/255.0;
    float green = ((float)((hex & 0xFF00)>>8))/255.0;
    float blue = ((float)(hex & 0xFF))/255.0;
    if (@available(iOS 10.0, *))
    {
        return   [UIColor colorWithDisplayP3Red:red green:green blue:blue alpha:alpha];
    }
  return   [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

// 将16进制转为 UIColor
+ (UIColor *) colorFromHexCode:(NSString *)hexString {
//    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
//    if([cleanString length] == 3) {
//        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
//                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
//                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
//                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
//    }
//    if([cleanString length] == 6) {
//        cleanString = [cleanString stringByAppendingString:@"ff"];
//    }
//
//    unsigned int baseValue;
//    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
//
//    float red = ((baseValue >> 24) & 0xFF)/255.0f;
//    float green = ((baseValue >> 16) & 0xFF)/255.0f;
//    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
//    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
//
//    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    
    
    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    if (@available(iOS 10.0, *))
    {
        return [UIColor colorWithDisplayP3Red:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    }
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    
    
    
}

// 将16进制转为 UIColor
+ (UIColor *) colorNoP3FromHexCode:(NSString *)hexString {

    NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

// 将16进制转为 UIColor
+ (UIColor *) colorFromHexCode:(NSString *)hexString andAlpha:(CGFloat)alpha{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    if (@available(iOS 10.0, *))
    {
        return [UIColor colorWithDisplayP3Red:red green:green blue:blue alpha:alpha];
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

// 将16进制转为 UIColor
+ (UIColor *) colorNoP3FromHexCode:(NSString *)hexString andAlpha:(CGFloat)alpha{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
