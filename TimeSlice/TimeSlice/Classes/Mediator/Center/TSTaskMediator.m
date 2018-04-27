//
//  TSTaskMediator.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/3.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSTaskMediator.h"
#import <objc/runtime.h>
#import "TSUrlHandler.h"
#import "TSTask.h"

@interface TSTaskMediator ()

@property (nonatomic, strong) NSMutableDictionary *cachedTarget;

@end

@implementation TSTaskMediator
+ (instancetype)sharedInstance {
    static TSTaskMediator *taskMediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        taskMediator = [[TSTaskMediator alloc] init];
    });
    
    return taskMediator;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

/*
 远程调用组件 scheme 组成
调用组件 scheme 组成
 scheme://[target]/[action]?[params]
 
 url sample:
 aaa://targetA/actionB?id=1234
 */
- (id)performActionWithUrl:(NSURL *)url completion:(void (^)(NSDictionary *))completion {
    return nil;
}

/*
 本地调用组件 scheme 组成
 scheme://[target]/[action]?[params]
 
 scheme： 业务(登录、用户相关、路由等等业务)
 target：   具体执行业务对象(类)
 action：  操作
 params：参数
 
 url sample:
 module://targetA/actionA
 
 NSURL *url = [NSURL URLWithString:@"http://www.testurl.com:8080/subpath/subsubpath?uid=123&gid=456"];
 [url scheme]
 http
 
 [url host]
 www.testurl.com
 
 [url port]
 8080
 
 [url path]
 /subpath/subsubpath
 
 [url lastPathComponent]
 subsubpath
 
 [url query]
 uid=123&gid=456
 */

- (id)performTargetWithURL:(NSURL *)url  params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget{
   TSTask* task = [TSUrlHandler handlePerformUrl:url];
    
    NSMutableDictionary *finalParams = [[NSMutableDictionary alloc]initWithDictionary:task.urlParams];
    
    [finalParams setValuesForKeysWithDictionary:params];
    
    return [self performTarget:task.targetName action:task.actionName params:finalParams shouldCacheTarget:shouldCacheTarget];
}


- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget {
    NSString *targetClassString = [NSString stringWithFormat:@"TS%@", targetName];
    NSString *actionString = [NSString stringWithFormat:@"action_%@:", actionName];
    Class targetClass;
    
    NSObject *target = self.cachedTarget[targetClassString];
    if (target == nil) {
        targetClass = NSClassFromString(targetClassString);
        target = [[targetClass alloc] init];
    }
    
    SEL action = NSSelectorFromString(actionString);
    
    if (target == nil) {
        // 这里是处理无响应请求的地方之一，这个demo做得比较简单，如果没有可以响应的target，就直接return了。实际开发过程中是可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求的
        return nil;
    }
    
    if (shouldCacheTarget) {
        self.cachedTarget[targetClassString] = target;
    }
    
    if ([target respondsToSelector:action]) {
        return [self safePerformAction:action target:target params:params];
    }else{
        // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
            return [self safePerformAction:action target:target params:params];
        } else {
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
            [self.cachedTarget removeObjectForKey:targetClassString];
            return nil;
        }
    }
}


- (id)safePerformAction:(SEL)action target:(NSObject *)target params:(NSDictionary *)params {
    NSMethodSignature* methodSig = [target methodSignatureForSelector:action];
    if(methodSig == nil) {
        return nil;
    }
    const char* retType = [methodSig methodReturnType];
    
    if (strcmp(retType, @encode(void)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        return nil;
    }
    
    if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        BOOL result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(CGFloat)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        CGFloat result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
    if (strcmp(retType, @encode(NSUInteger)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        [invocation setArgument:&params atIndex:2];
        [invocation setSelector:action];
        [invocation setTarget:target];
        [invocation invoke];
        NSUInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:params];
#pragma clang diagnostic pop
}

- (void)releaseCachedTargetWithTargetName:(NSString *)targetName {
    NSString *targetClassString = [NSString stringWithFormat:@"TS%@", targetName];
    [self.cachedTarget removeObjectForKey:targetClassString];
}

#pragma mark - getters and setters
- (NSMutableDictionary *)cachedTarget
{
    if (_cachedTarget == nil) {
        _cachedTarget = [[NSMutableDictionary alloc] init];
    }
    return _cachedTarget;
}


@end
