//
//  MyTableCell.h
//  care
//
//  Created by zhuang chaoxiao on 14-10-16.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataStruct.h"

@interface MyTableCell : UIView


-(id)initWithInfo;

-(id)initWithStr:(NSString*)str;


-(id)initWithListInfo:(ListInfo*)info;

@end
