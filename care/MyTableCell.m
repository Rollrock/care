//
//  MyTableCell.m
//  care
//
//  Created by zhuang chaoxiao on 14-10-16.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "MyTableCell.h"

@interface MyTableCell()
{
    
}
@end

@implementation MyTableCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithListInfo:(ListInfo*)info
{
    CGRect rect = CGRectMake(0, 0, 320, 65);
    self = [super initWithFrame:rect];
    
    if( self )
    {
        [self layoutViews:info];
    }
    
    return self;

}



-(id)initWithInfo
{
    CGRect rect = CGRectMake(0, 0, 320, 65);
    self = [super initWithFrame:rect];
    
    if( self )
    {
        [self layoutViews];
    }
    
    //self.backgroundColor = [UIColor grayColor];
    
    return self;
}



-(void)layoutViews:(ListInfo*)info
{
    CGRect rect;
    
    {
        rect = CGRectMake(10, 5,280, 18);
        UILabel * lab = [[UILabel alloc]initWithFrame:rect];
        
        lab.text = info.title;
        lab.font = [UIFont boldSystemFontOfSize:17];
        
        [self addSubview:lab];
    }
    
    {
        {
            {
                rect = CGRectMake(10, 25,280, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"类别:";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];
            }
            
            
            {
                rect = CGRectMake(45, 25,140, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = info.cate;
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];
                
            }
        }
        
        {
            {
                rect = CGRectMake(150, 25,35, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"品牌:";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];
                
            }
            
            {
                rect = CGRectMake(185, 25,75, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = info.brand;
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];
                
            }
        }
    }
    
    //////
    {
        
        {
            rect = CGRectMake(10, 45,280, 18);
            UILabel * lab = [[UILabel alloc]initWithFrame:rect];
            
            lab.text = info.time;
            lab.font = [UIFont systemFontOfSize:15];
            
            [self addSubview:lab];
        }
        
        
        {
            
            {
                rect = CGRectMake(150, 45,35, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"指数:";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];
                
            }
            
            {
                rect = CGRectMake(185, 45,75, 18);
                UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
                imgView.image = [UIImage imageNamed:@"tabbar_0"];
                
                [self addSubview:imgView];

            }
            
        }
        
    }
    
    
    {
        {
            rect = CGRectMake(280,25,25, 25);
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
            imgView.image = [UIImage imageNamed:@"tabbar_0"];
            
            [self addSubview:imgView];
            
            
        }
        
    }
    
}



-(void)layoutViews
{
    CGRect rect;
    
    {
        rect = CGRectMake(10, 5,280, 18);
        UILabel * lab = [[UILabel alloc]initWithFrame:rect];
        
        lab.text = @"肯德基使用苏丹红染红蛋糕";
        lab.font = [UIFont boldSystemFontOfSize:17];
        
        [self addSubview:lab];
    }
    
    {
        {
            {
                rect = CGRectMake(10, 25,280, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"类别:";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];
            }
            
            
            {
                rect = CGRectMake(45, 25,140, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"社会治安类";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];

            }
        }
        
        {
            {
                rect = CGRectMake(150, 25,35, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"品牌:";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];

            }
            
            {
                rect = CGRectMake(185, 25,75, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"三鹿奶粉啊";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];

            }
        }
    }
    
    //////
    {
        
        {
            rect = CGRectMake(10, 45,280, 18);
            UILabel * lab = [[UILabel alloc]initWithFrame:rect];
            
            lab.text = @"2008年12月28日";
            lab.font = [UIFont systemFontOfSize:15];
            
            [self addSubview:lab];
        }
        
        
        {
            
            {
                rect = CGRectMake(150, 45,35, 18);
                UILabel * lab = [[UILabel alloc]initWithFrame:rect];
                
                lab.text = @"指数:";
                lab.font = [UIFont systemFontOfSize:15];
                
                [self addSubview:lab];
                
            }
            
            {
                rect = CGRectMake(185, 45,75, 18);
                UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
                imgView.image = [UIImage imageNamed:@"tabbar_0"];
                
                [self addSubview:imgView];
                
                
            }

        }

    }
    
    
    {
        {
            rect = CGRectMake(280,25,25, 25);
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
            imgView.image = [UIImage imageNamed:@"tabbar_0"];
            
            [self addSubview:imgView];
            
            
        }

    }
    
}


@end
