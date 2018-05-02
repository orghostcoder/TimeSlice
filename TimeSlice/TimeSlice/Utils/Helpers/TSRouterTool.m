//
//  TSRouterTool.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/5/2.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSRouterTool.h"

static NSDictionary *_routeKeyValueDict;

@interface TSRouterTool()

@end

@implementation TSRouterTool
+ (TSRouterTool *)shareInstance {
    static dispatch_once_t onceToken;
    static TSRouterTool *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [TSRouterTool new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registerPageDictionary];
    }
    return self;
}

- (void)registerPageDictionary {
    _routeKeyValueDict = @{
                           @"newMission": @"TSNewMissionViewController"
                           };
}

- (Class)getPageClassWithPageName:(NSString *)pageName {
    if (pageName == nil) {
        return nil;
    }
    //找到对应的类
    NSString *className = _routeKeyValueDict[pageName];
    Class cls = NSClassFromString(className);
    if (!cls) {
        return nil;
    }
    return cls;
}

@end
