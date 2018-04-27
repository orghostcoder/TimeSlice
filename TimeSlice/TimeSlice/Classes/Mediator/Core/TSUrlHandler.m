//
//  TSUrlHandler.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/4.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSUrlHandler.h"
#import "TSTask.h"

@implementation TSUrlHandler
+ (void)prepareTargetUrlWithTask:(TSTask *)task {
    
}

+ (TSTask *)handlePerformUrl:(NSURL *)url {
    if (!url) {
        return nil;
    }
    
    TSTask *task = [[TSTask alloc] init];
    NSString *module = [url scheme];
    task.moduleName = module;
    
    NSString *target = [url host];
    task.targetName = target;
    
    NSString *path = [url path];
    NSString *action = [path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    task.actionName = action;
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSString *paramsString = [url query];
    
    if (paramsString) {
        for (NSString *param in [paramsString componentsSeparatedByString:@"&"]) {
            NSArray *elts = [param componentsSeparatedByString:@"="];
            if([elts count] < 2) continue;
            [params setObject:[elts lastObject] forKey:[elts firstObject]];
        }
    }
    if (params) {
        task.urlParams = params;
    }
    return task;
}
@end
