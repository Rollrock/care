//
//  dataStruct.h
//  care
//
//  Created by zhuang chaoxiao on 14-10-13.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import <Foundation/Foundation.h>


#define DEVICE_VER_7  ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES:NO)


#define NAVIGATION_BAR_HEIGHT 44.0f
#define CUSTOM_TAB_BAR_HEIGHT 60.0f
#define CUSTOM_TAB_BAR_OFFSET 11.0f //这里的11是因为中间center与其他四个tabitem的偏移

#define STATUS_BAR_HEIGHT 0.0f


#if TARGET_IPHONE_SIMULATOR
#define TARGET_IPHONE 0
#elif TARGET_OS_IPHONE
#define TARGET_IPHONE 1
#endif


@interface dataStruct : NSObject

@end
