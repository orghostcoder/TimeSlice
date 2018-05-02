//
//  TSRouter.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/25.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSRouter : NSObject
- (void)pushToPage:(NSDictionary *_Nonnull)pageParams;
//- (void)goToPage:(NSString *_Nonnull)pageName Params:(NSDictionary * __nullable)params;
//- (void)goToPage:(NSString *_Nonnull)pageName Params:(NSDictionary *__nullable)params DestroyCurrent:(BOOL)destroy;
//- (void)goToPage:(NSString *_Nonnull)pageName Params:(NSDictionary *__nullable)params Animated:(BOOL)Animated;
- (void)pushToPage:(NSDictionary *__nullable)pageParams animated:(BOOL)animated isDestroyCurrent:(BOOL)isDestroy;


@end
