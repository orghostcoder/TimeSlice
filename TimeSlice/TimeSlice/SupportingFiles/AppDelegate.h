//
//  AppDelegate.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/3/28.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSUIProvider;
@class TSBizProvider;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TSUIProvider *uiProvider;
@property (strong, nonatomic) TSBizProvider *bizProvider;
@property (strong, nonatomic) TSTheme *theme;

@end

