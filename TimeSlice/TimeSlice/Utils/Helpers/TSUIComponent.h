//
//  TSUIComponent.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/5/2.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSUIComponent : NSObject
// BarButtonItem

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target action:(SEL)action;
+ (UIBarButtonItem *)newBarButtonItemWithTarget:(id)target action:(SEL)action;

@end
