//
//  TYThemesManager.m
//  孟瑞瑞
//
//  Created by CSDN on 2017/1/19.
//  Copyright © 2018年 CSDN. All rights reserved.
//

#import "HXThemesManager.h"

#define lastThemeIndexKey @"lastThemeIndex"

@implementation HXThemesManager

//转换到指定主题
+ (void)switchTo:(CNThemesType)type {
    [ThemeManager setAnimationDuration:0.0];
    [ThemeManager setThemeWithIndex:type];   //0.2版本使用swift2.3不支持从沙盒或mainBundle的plist文件中取, 0.3支持
}

//转换到下一主题
+ (void)switchToNext {
    int next = ((int)[ThemeManager currentThemeIndex]) + 1;
    if (next > 1) { // cycle and without Night
        next = 0;
    }
    [self switchTo:next];
}

//转换到夜间主题
+ (void)switchNight:(BOOL)isToNight {
    [self switchTo:isToNight ? CNThemesTypeNight : CNThemesTypeDay];
}

//是否是夜间模式
+ (BOOL)isNight {
    return (((int)[ThemeManager currentThemeIndex]) == CNThemesTypeNight);
}

//还原上次使用的主题
+ (void)restoreLastTheme {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CNThemesType type = (int)[defaults integerForKey:lastThemeIndexKey];
    [self switchTo:type];
}

//保存上次使用的主题
+ (void)saveLastTheme {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:ThemeManager.currentThemeIndex forKey:lastThemeIndexKey];
}

@end
