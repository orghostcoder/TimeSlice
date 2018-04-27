//
//  TSTask.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/4.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSTask : NSObject
@property (nonatomic, strong) NSString *moduleName;
@property (nonatomic, strong) NSString *targetName;
@property (nonatomic, strong) NSString *actionName;
@property (nonatomic, strong) NSDictionary *urlParams;

@end
