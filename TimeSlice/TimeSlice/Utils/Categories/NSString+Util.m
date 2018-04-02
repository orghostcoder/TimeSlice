//
//  NSString+Util.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/3/20.
//  Copyright © 2018年 TimeSlice.com. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)
- (BOOL)isPhoneNumber {
    NSString *phoneRegex = @"^[0-9]{11}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL isValid = [phoneTest evaluateWithObject:self];
    
    return isValid;
}

- (BOOL)isEmail {
    NSString *emailRegex = @"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isValid = [emailTest evaluateWithObject:self];
    
    return isValid;
}

- (BOOL)isURL {
    if (self == nil) {
        return NO;
    }
    NSString *url;
    if (self.length > 4 && [[self substringToIndex:4] isEqualToString:@"www."]) {
        url = [NSString stringWithFormat:@"http://%@",self];
    }else {
        url = self;
    }
    NSString *urlRegex = @"(https|http|ftp|rtsp|igmp|file|rtspt|rtspu)://((((25[0-5]|2[0-4]\\d|1?\\d?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1?\\d?\\d))|([0-9a-z_!~*'()-]*\\.?))([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\.([a-z]{2,6})(:[0-9]{1,4})?([a-zA-Z/?_=]*)\\.\\w{1,5}";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegex];
    BOOL isValid = [urlTest evaluateWithObject:urlTest];
    return isValid;
}

- (BOOL)isBlank {
    return [self trim].length == 0;
}

- (BOOL)isNotBlank {
    return [self trim].length > 0;
}

- (NSString *)trim {
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return trimmedString;
}

+ (NSString *)documentDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
}

+ (NSString *)libraryDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) firstObject];
}

+ (NSString *)cacheDirectoryPath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject];
}

@end
