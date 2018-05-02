//
//  TSTheme.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/30.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TSThemeType) {
    TSThemeDefaultType,
};

@interface TSTheme : NSObject
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *tabBarTintNomalColor;
@property (nonatomic, strong) UIColor *tabbarTintSelectColor;
@property (nonatomic, strong) UIColor *navigationBarTintColor;
@property (nonatomic, strong) UIColor *navigationBarTitleColor;

- (void)loadTheme:(TSThemeType)themeType;
@end
