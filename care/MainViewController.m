//
//  MainViewController.m
//  Disney
//
//  Created by zhuang chaoxiao on 13-10-21.
//  Copyright (c) 2013年 zhuang chaoxiao. All rights reserved.
//

#import "MainViewController.h"
#import "dataStruct.h"

@interface MainViewController ()<tabbarViewDelegate>

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor grayColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //NSLog(@"%f-%f",[[UIScreen mainScreen] bounds].origin.x,[[UIScreen mainScreen] bounds].origin.y);
    
    CGRect rect;
    
    rect = CGRectMake(0,  [[UIScreen mainScreen] bounds].size.height-CUSTOM_TAB_BAR_HEIGHT, 320, CUSTOM_TAB_BAR_HEIGHT);

    
    _tabbarView = [[tabbarView alloc]initWithFrame:rect];
    
    _tabbarView.delegate = self;
    
    [self.view addSubview:_tabbarView];
    
    [self initSubViewController];
    
    [self.view insertSubview:_firstNav.view belowSubview:_tabbarView];
}


-(void)initSubViewController
{
    _firstViewC = [[FirstViewController alloc]initWithNibName:nil bundle:nil];
    _firstNav = [[UINavigationController alloc]init];
    
    _firstViewC.title = @"乐园简介";
    
    [_firstNav pushViewController:_firstViewC animated:NO];
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    _secondViewC = [[SecondViewController alloc]initWithNibName:nil bundle:nil];
    _secondNav = [[UINavigationController alloc]init];
    _secondViewC.title = @"旅游攻略";
    
    [_secondNav pushViewController:_secondViewC animated:NO];
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    _centerViewC = [[CenterViewController alloc]initWithNibName:nil bundle:nil];
    _centerNav = [[UINavigationController alloc]init];
    _centerViewC.title = @"乐园详情";
    
    [_centerNav pushViewController:_centerViewC animated:NO];

    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    _thirdViewC = [[ThirdViewController alloc]initWithNibName:nil bundle:nil];
    _thirdNav = [[UINavigationController alloc]init];
    _thirdViewC.title = @"周边旅游推荐";
    
    [_thirdNav pushViewController:_thirdViewC animated:NO];
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    _fourthViewC = [[FourthViewController alloc]initWithNibName:nil bundle:nil];
    _fourthNav = [[UINavigationController alloc]init];
  
    
    _fourthViewC.title = @"设置";
    
    [_fourthNav pushViewController:_fourthViewC animated:NO];
    
}



-(void)tabClickIndex:(NSInteger)index
{
    NSLog(@"tabClickIndex:%d",index);
    
    UIView * currView = [[self.view subviews]objectAtIndex:0];
    
    [currView removeFromSuperview];
    
    if( 1 == index )
    {
        [self.view insertSubview:_firstNav.view belowSubview:_tabbarView];
    }
    else if( 2 == index )
    {
        [self.view insertSubview:_secondNav.view belowSubview:_tabbarView];
    }
    else if( 0 == index )
    {
        [self.view insertSubview:_centerNav.view belowSubview:_tabbarView];
    }
    else if( 3 == index )
    {
        [self.view insertSubview:_thirdNav.view belowSubview:_tabbarView];
    }
    else if( 4 == index )
    {
        [self.view insertSubview:_fourthNav.view belowSubview:_tabbarView];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
