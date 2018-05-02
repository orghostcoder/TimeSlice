//
//  TSRouterTool.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/5/2.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSRouterTool : NSObject
+ (TSRouterTool *)shareInstance;

- (Class)getPageClassWithPageName:(NSString *)pageName;

@end
