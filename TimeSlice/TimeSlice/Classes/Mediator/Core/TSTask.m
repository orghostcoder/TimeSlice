//
//  TSTask.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/4.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSTask.h"

@implementation TSTask
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moduleName = @"";
        self.targetName = @"";
        self.actionName = @"";
        self.urlParams = nil;
    }
    return self;
}

@end
