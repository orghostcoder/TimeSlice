//
//  TSUIProvider.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/27.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSUIProvider.h"
#import "TSTabBarController.h"

@interface TSUIProvider()
@property (strong, nonatomic) UIWindow *window;
@end

@implementation TSUIProvider
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initTabbar];
    }
    return self;
}

- (void)initTabbar {
    TSTabBarController *tabbarViewController = [[TSTabBarController alloc]init];
    self.window = [[UIApplication sharedApplication].delegate window];
    self.window.rootViewController = tabbarViewController;
    [self.window makeKeyAndVisible];
}
                   
                   
@end
