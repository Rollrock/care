//
//  RockWaitView.m
//  waitView
//
//  Created by zhuang chaoxiao on 14-9-30.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "RockWaitView.h"


@implementation RockWaitView

-(void)dismiss
{
    [UIView animateWithDuration:0.5 animations:^(void){
        
        self.alpha = 0.1;
        
    }completion:^(BOOL finish){
        
        [_waitView stopAnimating];
        [_waitView removeFromSuperview];
        
        [_strLab removeFromSuperview];
        
        [self removeFromSuperview];
        
    }];
}


-(id)initWithParentView:(UIView*)parentView withStr:(NSString*)waitStr
{
    self = [[RockWaitView alloc]init];
    
    if( self )
    {
        CGRect rect = [[UIScreen mainScreen] bounds];
        
        self.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        self.backgroundColor = [UIColor brownColor];
        
        [parentView addSubview:self];
        
        ////
        
        rect = CGRectMake(0, 0, 50, 50);
        _waitView = [[UIActivityIndicatorView alloc]initWithFrame:rect];
        _waitView.center = CGPointMake(self.center.x, self.center.y);
        _waitView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self addSubview:_waitView];
        
        [_waitView startAnimating];
        
        //////
        _strLab = [[UILabel alloc]initWithFrame:rect];
        _strLab.backgroundColor = [UIColor clearColor];
        _strLab.text = waitStr;
        _strLab.textAlignment = NSTextAlignmentCenter;
        _strLab.font = [UIFont systemFontOfSize:15];
        
        _strLab.frame = CGRectMake(0, 0, 80, 20);
        _strLab.center = CGPointMake(self.center.x, self.center.y + 30);
        
        
        [self addSubview:_strLab];
    }
    
    return self;
}



@end
