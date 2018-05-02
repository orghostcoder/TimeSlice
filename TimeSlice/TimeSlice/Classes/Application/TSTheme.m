//
//  TSTheme.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/30.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSTheme.h"

@implementation TSTheme
- (void)loadTheme:(TSThemeType)themeType {
    self.tintColor = HEXRGBCOLOR(0xF8F8F8);
    self.tabBarTintNomalColor = HEXRGBCOLOR(0x333333);
    self.tabbarTintSelectColor = HEXRGBCOLOR(0x0B4FFF);
    self.navigationBarTintColor = HEXRGBCOLOR(0xF8F8F8);
    self.navigationBarTitleColor =HEXRGBCOLOR(0x333333);
    
    UITabBarItem *tabbarItem = [UITabBarItem appearance];
    NSMutableDictionary *nomalAttributes = [NSMutableDictionary dictionary];
    nomalAttributes[NSForegroundColorAttributeName] = _THEME.tabBarTintNomalColor;
    NSMutableDictionary *selectedAttributes=[NSMutableDictionary dictionary];
    selectedAttributes[NSForegroundColorAttributeName] = _THEME.tabbarTintSelectColor;
    [tabbarItem setTitleTextAttributes:nomalAttributes forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    
    NSDictionary *titleAttributes = @{ NSForegroundColorAttributeName: self.navigationBarTitleColor };
    [[UINavigationBar appearance] setBarTintColor:self.navigationBarTintColor];
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttributes];
    
}
@end
