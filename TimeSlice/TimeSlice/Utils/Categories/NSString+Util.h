//
//  NSString+Util.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/3/20.
//  Copyright © 2018年 TimeSlice.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

- (BOOL)isPhoneNumber;
- (BOOL)isEmail;
- (BOOL)isURL;

- (NSString *)trim;
- (BOOL)isBlank;
- (BOOL)isNotBlank;

+ (NSString *)documentDirectoryPath;
+ (NSString *)libraryDirectoryPath;
+ (NSString *)cacheDirectoryPath;



@end
