//
//  LZBStatusFrame.h
//  Cell自定制-微博
//
//  Created by ZBLi on 15/10/26.
//  Copyright (c) 2015年 ZBLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LZBStatus;

@interface LZBStatusFrame : NSObject

//每个子控件的frame设置为readonly，一次计算完成之后，不允许改变
@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign, readonly) CGRect nameF;
@property (nonatomic, assign, readonly) CGRect vipF;
@property (nonatomic, assign, readonly) CGRect textF;
@property (nonatomic, assign, readonly) CGRect picF;

//计算每个cell的高度
@property (nonatomic, assign, readonly) CGFloat cellHeight;

//需要数据才能计算每个子控件的frame以及cell的高度
@property (nonatomic, strong) LZBStatus * status;

@end
