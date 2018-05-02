//
//  TSMacro.h
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/27.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#ifndef TSMacro_h
#define TSMacro_h

#define _APPDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define _UI _APPDelegate.uiProvider
#define _BIZ _APPDelegate.bizProvider
#define _THEME _APPDelegate.theme

#define TSImage(imageName) [UIImage imageNamed:imageName]
#define TSString(key) NSLocalizedString(key, @"")
#define TSFont(x) [UIFont systemFontOfSize:x]

#endif /* TSMacro_h */
