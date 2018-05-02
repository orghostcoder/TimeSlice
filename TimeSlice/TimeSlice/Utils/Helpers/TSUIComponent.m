//
//  TSUIComponent.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/5/2.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSUIComponent.h"

@implementation TSUIComponent

+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithImage:TSImage(@"naviagtion_back")
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}

+ (UIBarButtonItem *)newBarButtonItemWithTarget:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc]initWithImage:TSImage(@"navigation_new")
                                           style:UIBarButtonItemStylePlain
                                          target:target
                                          action:action];
}

@end
