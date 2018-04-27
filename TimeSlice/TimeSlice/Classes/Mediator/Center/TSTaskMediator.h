//
//  TSTaskMediator.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/3.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TSTaskMediator : NSObject
+ (instancetype)sharedInstance;

// 远程App调用入口
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

// 本地组件调用入口
//本地任务分发
- (id)performTargetWithURL:(NSURL *)url  params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;

- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end
/**
 组件划分的粒度，
 **/
