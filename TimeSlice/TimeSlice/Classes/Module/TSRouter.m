//
//  TSRouter.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/25.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSRouter.h"
#import "TSRouterTool.h"


@interface TSRouter()

@end

@implementation TSRouter
- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}

- (void)pushToPage:(NSDictionary *_Nonnull)pageParams {
    [self pushToPage:pageParams animated:YES isDestroyCurrent:NO];
}

- (void)pushToPage:(NSDictionary *__nullable)pageParams animated:(BOOL)animated isDestroyCurrent:(BOOL)isDestroy {
    
    NSString *module = pageParams[@"module"];
    if (!module) {
        return;
    }
    
    Class clazz = [[TSRouterTool shareInstance] getPageClassWithPageName:module];
    if (!clazz) {
        return;
    }
    
    UIViewController *targetController = [clazz new];
    targetController.hidesBottomBarWhenPushed = YES;
    SEL action = NSSelectorFromString(@"parseParameters:");
    if ([targetController respondsToSelector:action]) {
        [targetController performSelectorOnMainThread:action withObject:pageParams waitUntilDone:YES];
    }
    
    UINavigationController *navigationController = (UINavigationController *)pageParams[@"navigationController"];
    [navigationController pushViewController:targetController animated:YES];
    
}

@end
