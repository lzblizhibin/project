//
//  ViewController.m
//  Cell自定制-微博
//
//  Created by ZBLi on 15/10/26.
//  Copyright (c) 2015年 ZBLi. All rights reserved.
//

#import "ViewController.h"
#import "LZBStatus.h"
#import "LZBStatusCell.h"
#import "LZBStatusFrame.h"

@interface ViewController ()

//每个cell的frame模型既包括子控件的frame，也包括每个cell的高度
@property (nonatomic, strong) NSArray * statusFrameAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.tableView.rowHeight = 400;
}

- (NSArray *)statusFrameAry
{
    if (_statusFrameAry == nil) {
        NSMutableArray * statusMulAry = [[NSMutableArray alloc] init];
        NSString * path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray * statusAry = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary * dic in statusAry) {
            LZBStatus * statusInfo = [LZBStatus statusWithDictionary:dic];
            
            //将每个cellFrame放入数组中
            LZBStatusFrame * frame = [[LZBStatusFrame alloc] init];
            //通过setter方法计算每个cell的高度和子控件的frame
            frame.status = statusInfo;
            
            [statusMulAry addObject:frame];
        }
        _statusFrameAry = statusMulAry;
    }
    return  _statusFrameAry;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrameAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1、创建cell
    LZBStatusCell * cell = [LZBStatusCell cellWithTableView:tableView];
    
    //2、给cell赋值
    cell.statusFrame = self.statusFrameAry[indexPath.row];
    return cell;
}

#pragma mark - 实现代理方法,返回cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出frame模型，返回cell的高度
    LZBStatusFrame * frame = self.statusFrameAry[indexPath.row];
    return frame.cellHeight;
}


@end
