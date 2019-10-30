//
//  TYThemesManager.h
//  孟瑞瑞
//
//  Created by CoderLiu on 2017/1/19.
//  Copyright © 2018年 CSDN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    CNThemesTypeDay = 0,
    CNThemesTypeNight
} CNThemesType;

@interface HXThemesManager : NSObject

//转换到指定主题
+ (void)switchTo:(CNThemesType)type;

//转换到下一主题
+ (void)switchToNext;

//转换到夜间主题
+ (void)switchNight:(BOOL)isToNight;

//是否是夜间模式
+ (BOOL)isNight;

//还原上次使用的主题
+ (void)restoreLastTheme;

//保存上次使用的主题
+ (void)saveLastTheme;

@end
