//
//  UIColor+Extension.h
//  
//
//  Created by 孟瑞瑞 on 15/9/18.
//  Copyright (c) 2018年 CSDN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HXExtension)
+(UIColor *)colorWith255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;
+(UIColor *)colorWithHex:(long)hex andAlpha:(CGFloat)alpha;
/**
 *  将16进制转为 UIColor
 */
+ (UIColor *)colorFromHexCode:(NSString *)hexString;

// 将16进制转为 UIColor
+ (UIColor *) colorNoP3FromHexCode:(NSString *)hexString;

// 将16进制转为 UIColor
+ (UIColor *) colorFromHexCode:(NSString *)hexString andAlpha:(CGFloat)alpha;

+ (UIColor *) colorNoP3FromHexCode:(NSString *)hexString andAlpha:(CGFloat)alpha;
@end
