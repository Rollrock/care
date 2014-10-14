//
//  FirstViewController.m
//  care
//
//  Created by zhuang chaoxiao on 14-10-13.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "FirstViewController.h"
#import "dataStruct.h"
#import "MyTableViewCell.h"
#import "EGORefreshTableHeaderView.h"

@interface FirstViewController ()<EGORefreshTableHeaderDelegate,UITableViewDataSource,UITableViewDelegate>
{
    EGORefreshTableHeaderView * _egoView;
    BOOL _reloading;
    UITableView *_tabView;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self layoutTableView];
    
    [self layoutEgoView];
}


-(void)layoutTableView
{
    CGRect rect = CGRectMake(0, 64, 320, 400);
    
    _tabView = [[UITableView alloc]initWithFrame:rect];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    
    [self.view addSubview:_tabView];
}

-(void)layoutEgoView
{
    CGRect rect = CGRectMake(0, 0-65, 320, 65);
    
    _egoView = [[EGORefreshTableHeaderView alloc]initWithFrame:rect];
    [_tabView addSubview:_egoView];
    
    _egoView.delegate = self;
    
    // [_egoView refreshLastUpdatedDate];
}

//下拉控件刷新触发事件
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    [self reloadTableViewDataSource];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    return _reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    return [NSDate date]; // should return date data source was last changed
}

#pragma mark - UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    [_egoView egoRefreshScrollViewDidScroll:scrollView];
    
    
    NSLog(@"-----");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [_egoView egoRefreshScrollViewDidEndDragging:scrollView];
    
}


#pragma mark Data Source Loading / Reloading Methods
//下拉动作触发事件调用的函数。在这里发送数据请求
- (void)reloadTableViewDataSource{
    
    //  should be calling your tableviews data source model to reload
    //  put here just for demo
    NSLog(@"dragging!!!");
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(doneLoadingTableViewData) userInfo:nil repeats:NO];
    _reloading = YES;
    
}
//请求结束函数。在这里要关闭下拉的视图.并更新表视图
- (void)doneLoadingTableViewData{
    
    //  model should call this when its done loading
    NSLog(@"stop loading");
    
    
    _reloading = NO;
    [_egoView egoRefreshScrollViewDataSourceDidFinishedLoading:_tabView];
    
    //[listData addObject:[[NSString alloc] initWithFormat:@"%d",[listData count]]];
    
    //[_tabView reloadData];
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 21;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
    static NSString * strId = @"MyTableViewCell";
    static BOOL bFlag = YES;
    
    if( bFlag )
    {
        bFlag = !bFlag;
        
        UINib * nib = [UINib nibWithNibName:@"MyTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:strId];
    }
    
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:strId];
    ///cell.title.text = [NSString stringWithFormat:@"title:%ld",indexPath.row];
    
    
    return  cell;
     */
    static NSString * strId = @"MyTableViewCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:strId];
    
    if( cell == nil )
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"---%d---",indexPath.row];
    
    
    
    return cell;
    
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
