//
//  LZBStatusCell.h
//  Cell自定制-微博
//
//  Created by ZBLi on 15/10/26.
//  Copyright (c) 2015年 ZBLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class LZBStatusFrame;

@interface LZBStatusCell : UITableViewCell

//这里cell只需要拥有frame模型即可，因为frame模型中有数据
@property (nonatomic, strong) LZBStatusFrame * statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
