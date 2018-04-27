//
//  TSUrlHandler.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/4.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TSTask;
@interface TSUrlHandler : NSObject
+ (void)prepareTargetUrlWithTask:(TSTask *)task;
+ (TSTask *)handlePerformUrl:(NSURL *)url;

@end
