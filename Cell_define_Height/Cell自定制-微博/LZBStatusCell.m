//
//  LZBStatusCell.m
//  Cell自定制-微博
//
//  Created by ZBLi on 15/10/26.
//  Copyright (c) 2015年 ZBLi. All rights reserved.
//

#import "LZBStatusCell.h"
#import "LZBStatus.h"
#import "LZBStatusFrame.h"

// 昵称的字体
#define LZBNameFont [UIFont systemFontOfSize:14]
// 正文的字体
#define LZBTextFont [UIFont systemFontOfSize:15]


@interface LZBStatusCell ()

/** 头像图标*/
@property (nonatomic, weak) UIImageView * iconView;

/** 微博名称*/
@property (nonatomic, weak) UILabel * nameLabel;

/** vip图标*/
@property (nonatomic, weak) UIImageView * vipView;

/** 正文描述*/
@property (nonatomic, weak) UILabel * contentLabel;

/** 配图*/
@property (nonatomic, weak) UIImageView * pictureView;


@end

@implementation LZBStatusCell

//对外封装一个类方法来创建cell，controller不需要知道我的cell是如何创建的，无论我是通过代码创建或者是通过xib创建controller都不需要知道，提高模块的封装性
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"status";
    LZBStatusCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[LZBStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

//自定义cell，新建一个类继承自UITableViewCell，并且重写- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier这个方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //不能直接这样写，会有警告，将强引用给弱引用有警告，需要先把它添加到视图上，这样就变为强指针了
        //self.iconView = [[UIImageView alloc] init];
        UIImageView * iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        _iconView = iconView;
        
        UILabel * name = [[UILabel alloc] init];
        name.font = LZBNameFont;
        [self.contentView addSubview:name];
        _nameLabel = name;
        
        UIImageView * vipView = [[UIImageView alloc] init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        _vipView = vipView;
        
        UILabel * text = [[UILabel alloc] init];
        text.numberOfLines = 0;
        text.font = LZBTextFont;
        [self.contentView addSubview:text];
        _contentLabel = text;
        
        UIImageView * picture = [[UIImageView alloc] init];
        [self.contentView addSubview:picture];
        _pictureView = picture;
    }
    return self;
}

- (void)setStatusFrame:(LZBStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    //1、设置数据
    [self setdata];
    
    //2、根据模型数据来计算每个子控件的frame
    [self setChildFrame];
}

- (void)setdata
{
    //设置头像
    self.iconView.image = [UIImage imageNamed:self.statusFrame.status.icon];
    //设置微博名称
    self.nameLabel.text = self.statusFrame.status.name;
    //设置VIP图标
    if (self.statusFrame.status.vip) {
        self.vipView.hidden = NO;
        self.nameLabel.textColor = [UIColor redColor];
    }else {
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    //设置正文文字
    self.contentLabel.text = self.statusFrame.status.text;
    
    //这是配图
    if (self.statusFrame.status.picture) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:self.statusFrame.status.picture];
    }else {
        self.pictureView.hidden = YES;
    }
}



- (void)setChildFrame
{
    self.iconView.frame = self.statusFrame.iconF;
    
    self.nameLabel.frame = self.statusFrame.nameF;
    
    self.vipView.frame = self.statusFrame.vipF;

    self.contentLabel.frame = self.statusFrame.textF;
    
    //设置配图
    if (self.statusFrame.status.picture) {//有配图才需要设置
        self.pictureView.frame = self.statusFrame.picF;
    }
}

@end
