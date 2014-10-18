//
//  dataStruct.m
//  care
//
//  Created by zhuang chaoxiao on 14-10-13.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "dataStruct.h"

@implementation dataStruct

@end


@implementation ListInfo


-(void)parseDict:(NSDictionary*)dict
{
    _cate = [dict objectForKey:@"cate"];
    _brand = [dict objectForKey:@"brand"];
    _detailUrl = [dict objectForKey:@"detailUrl"];
    _level = [dict objectForKey:@"level"];
    _time = [dict objectForKey:@"time"];
    _title = [dict objectForKey:@"title"];
    
    
    NSLog(@"-%@-%@-%@-%@-%@-%@",_cate,_brand,_detailUrl,_level,_time,_title);
    
}

@end