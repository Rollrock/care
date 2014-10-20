//
//  DetailViewController.m
//  care
//
//  Created by zhuang chaoxiao on 14-10-18.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "DetailViewController.h"
#import "JSONKit.h"
#import "UIImageView+WebCache.h"
#import "dataStruct.h"
#import "RockWaitView.h"

@interface DetailViewController ()<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    
    NSURLConnection * _conn;
    NSMutableData * _data;
    
    RockWaitView * _waitView;
    
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _waitView = [[RockWaitView alloc]initWithParentView:self.view withStr:@"加载中... "];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self startRequest];
    
}


-(void)layoutViews:(NSDictionary*)dict
{
    if(![dict isKindOfClass:[NSDictionary class]])
    {
        return;
    }
    
    CGRect rect;
    float yPos = 0;
    
    rect = CGRectMake(0, NAVIGATION_BAR_HEIGHT + STATUS_BAR_HEIGHT, 320, SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT-CUSTOM_TAB_BAR_HEIGHT);
    
    UIScrollView * scView = [[UIScrollView alloc]initWithFrame:rect];
    [self.view addSubview:scView];
    
    //
    {
        rect = CGRectMake(10, yPos+10, 300, 20);
        UILabel * title = [[UILabel alloc]initWithFrame:rect];
        title.text = [dict objectForKey:@"title"];
        title.font = [UIFont boldSystemFontOfSize:22];
        [scView addSubview:title];
        
        yPos += 10+20;
    }
    
    {
        rect = CGRectMake(10, yPos+5, 300, 15);
        UILabel * time = [[UILabel alloc]initWithFrame:rect];
        time.text = [dict objectForKey:@"time"];
        time.font = [UIFont systemFontOfSize:15];
        [scView addSubview:time];
        
        yPos += 5+15;
    }
    
    {
        {
            rect = CGRectMake(10, yPos+5, 150, 15);
            UILabel * time = [[UILabel alloc]initWithFrame:rect];
            time.text = [NSString stringWithFormat:@"类别:%@",[dict objectForKey:@"cate"]];
            time.font = [UIFont systemFontOfSize:15];
            [scView addSubview:time];
         }
        
        {
            rect = CGRectMake(10+150, yPos+5, 150, 15);
            UILabel * time = [[UILabel alloc]initWithFrame:rect];
            time.text = [NSString stringWithFormat:@"品牌:%@",[dict objectForKey:@"brand"]];
            time.font = [UIFont systemFontOfSize:15];
            [scView addSubview:time];
            
            yPos += 5+15;
        }

    }
    
    
    {
        {
            rect = CGRectMake(10, yPos+5, 150, 15);
            UILabel * time = [[UILabel alloc]initWithFrame:rect];
            time.text = @"等级:";
            time.font = [UIFont systemFontOfSize:15];
            [scView addSubview:time];
            
        }
        
        {
            rect = CGRectMake(10+30, yPos+5, 80, 15);
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
            NSNumber *num = [dict objectForKey:@"level"];
            imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"level_%d",[num integerValue]]];
            [scView addSubview:imgView];
            
            yPos += 5+15;
        }
    }
    
    
    yPos += 20;
    //图片
    NSArray * imgArray = [dict objectForKey:@"img"];
    for(NSDictionary * subDic in imgArray )
    {
        NSString * url = [subDic objectForKey:@"url"];
        
        rect = CGRectMake(10, yPos, 300, 200);
        yPos += 200;
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:rect];
        
        [imgView setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
        [scView addSubview:imgView];
        
        yPos += 10;
    }
    
    //正文
    
    {
        NSArray * array = [dict objectForKey:@"Article"];
        
        for( NSDictionary * subDic in array )
        {
            rect = CGRectMake(10, yPos, 300, 18);
            UILabel * lab = [[UILabel alloc]initWithFrame:rect];
            lab.text = [subDic objectForKey:@"title"];
            lab.font = [UIFont boldSystemFontOfSize:20];
            [scView addSubview:lab];
            yPos += 20;
            
            rect = CGRectMake(10, yPos, 300, 0);
            UITextView * textView = [[UITextView alloc]initWithFrame:rect];
            textView.scrollEnabled = NO;
            textView.text = [subDic objectForKey:@"desc"];
            [self getHeightForm:textView.text whitTextView:textView];
            [scView addSubview:textView];
            
            yPos += textView.frame.size.height;
            
            yPos += 10;
        }
    }
    
    scView.contentSize = CGSizeMake(320, yPos);
    
}

-(void)getHeightForm:(NSString*)str whitTextView:(UITextView*)textView
{
    textView.font =[UIFont systemFontOfSize:16];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    NSDictionary *attribute = @{NSFontAttributeName:textView.font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    

    CGSize size = [str boundingRectWithSize:CGSizeMake(textView.frame.size.width, 20000) options:  NSStringDrawingUsesLineFragmentOrigin  attributes:attribute context:nil].size;
    
    textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, textView.frame.size.width, size.height);
    
}


-(void)startRequest
{
    NSURL * url = [NSURL URLWithString:_strUrl];
    NSURLRequest * req = [[NSURLRequest alloc]initWithURL:url];
    _conn = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    
    _data = nil;
    _data = [[NSMutableData alloc]init];
    
}



-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
{
    
}


-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data
{
    
    [_data appendData:data];
}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError *)error
{
    NSLog(@"conn fail:%@",error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSLog(@"receData--:%@",_data);
    
    NSString * str = [[NSString alloc]initWithData:_data encoding:NSUTF8StringEncoding];
    NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary * dict = [data objectFromJSONData];
    
    NSLog(@"dict:%@",dict);
    
    
    [_waitView dismiss];
    
    [self layoutViews:dict];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
