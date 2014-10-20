//
//  FirstViewController.m
//  care
//
//  Created by zhuang chaoxiao on 14-10-13.
//  Copyright (c) 2014年 zhuang chaoxiao. All rights reserved.
//

#import "FirstViewController.h"
#import "dataStruct.h"
#import "MyTableCell.h"
#import "JSONKit.h"
#import "EGORefreshTableHeaderView.h"
#import "DetailViewController.h"
#import "RockWaitView.h"


#define TARGET_URL   @"http://www.999dh.net/CareAbout/HotList.txt"

@interface FirstViewController ()<EGORefreshTableHeaderDelegate,UITableViewDataSource,UITableViewDelegate,NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    EGORefreshTableHeaderView * _egoView;
    BOOL _reloading;
    UITableView *_tabView;
    
    NSURLConnection * _conn;
    NSMutableData * _data;
    
    NSMutableArray * _listArray;
    
    RockWaitView * _waitView;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self layoutTableView];
    
    [self layoutEgoView];
    
    
    [self startRequest];
    
    
    _waitView = [[RockWaitView alloc]initWithParentView:self.view withStr:@"加载中...."];
}


-(void)startRequest
{
    NSURL * url = [NSURL URLWithString:TARGET_URL];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    
    _conn = nil;
    _conn = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    
    _data = nil;
    _data = [[NSMutableData alloc]init];
    
    
    _listArray = nil;
    _listArray = [[NSMutableArray alloc]init];
}

-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response
{
    
}


-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data
{
   //NSLog(@"receData:%@",data);
    
    [_data appendData:data];
}

-(void)connection:(NSURLConnection*)connection didFailWithError:(NSError *)error
{
    NSLog(@"conn fail:%@",error);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString * str = [[NSString alloc]initWithData:_data encoding:NSUTF8StringEncoding];
    NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary * dict = [data objectFromJSONData];
    
     NSLog(@"dict:%@",dict);
    
    NSArray * arr = [dict objectForKey:@"info"];
    
    if( [arr isKindOfClass:[NSArray class]] )
    {
        for( NSDictionary * subDic in arr )
        {
            ListInfo * info = [[ListInfo alloc]init];
            [info parseDict:subDic];
            
            [_listArray addObject:info];
        }
    }
    
    [_waitView dismiss];
    
    [_tabView reloadData];
}

-(void)layoutTableView
{
    CGRect rect = CGRectMake(0, 0, 320, SCREEN_HEIGHT-50);
    
    _tabView = [[UITableView alloc]initWithFrame:rect];
    
    _tabView.delegate = self;
    _tabView.dataSource = self;
    //_tabView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:_tabView];
}

-(void)layoutEgoView
{
    //CGRect rect = CGRectMake(0, -65, 320, 65);
    
    //_egoView = [[EGORefreshTableHeaderView alloc]initWithFrame:rect];
    //[_tabView addSubview:_egoView];
    
    
    //NSLog(@"--%f----%f",_egoView.frame.origin.y,_egoView.frame.size.height);
    
    //_egoView.delegate = self;
    
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




//////////////////////////////////////////////////////////////////////////////////////////////////////


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListInfo * info = [_listArray objectAtIndex:indexPath.row];
    
    DetailViewController * vc = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
    vc.strUrl = info.detailUrl;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strCellId = @"cellId";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:strCellId];
    
    if( !cell )
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCellId];
    }
    else
    {
        for( UIView * view in [cell.contentView subviews] )
        {
            [view removeFromSuperview];
        }
    }
    
    NSLog(@"---row:%d",indexPath.row);

    MyTableCell * cellView = [[MyTableCell alloc]initWithListInfo:[_listArray objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:cellView];
    
    
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
