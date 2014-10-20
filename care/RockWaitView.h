//
//  RockWaitView.h
//  waitView
//
//  Created by zhuang chaoxiao on 14-9-30.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RockWaitView : UIView
{
    UIActivityIndicatorView * _waitView;
    UILabel * _strLab;
}


-(id)initWithParentView:(UIView*)parentView withStr:(NSString*)waitStr;

-(void)dismiss;

@end
