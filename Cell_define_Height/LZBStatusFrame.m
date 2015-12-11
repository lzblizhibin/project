//
//  LZBStatusFrame.m
//  Cell自定制-微博
//
//  Created by ZBLi on 15/10/26.
//  Copyright (c) 2015年 ZBLi. All rights reserved.
//

#import "LZBStatusFrame.h"
#import "LZBStatus.h"

// 昵称的字体
#define LZBNameFont [UIFont systemFontOfSize:14]
// 正文的字体
#define LZBTextFont [UIFont systemFontOfSize:15]

@implementation LZBStatusFrame


/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)setStatus:(LZBStatus *)status
{
    _status = status;
    //设置子控件间隙
    CGFloat padding = 10;
    
    //设置图标
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    
    //设置name
    CGSize nameSize = [self sizeWithText:self.status.name font:LZBNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    CGFloat nameX = CGRectGetMaxX(_iconF) + padding;
    CGFloat nameY = iconY + (iconH - nameH) * 0.5;
    _nameF = CGRectMake(nameX, nameY, nameW, nameH);
    
    //设置会员图标
    CGFloat vipX = CGRectGetMaxX(_nameF) + padding;
    CGFloat vipY = nameY;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    
    //设置正文
    //maxSize:CGSizeMake(350, MAXFLOAT)  设置最大的宽和高，宽设置为适应屏幕就差不多了，高的话最大就行了，切记宽不能设置为MAXFLOAT
    CGSize textSize = [self sizeWithText:self.status.text font:LZBTextFont maxSize:CGSizeMake(350, MAXFLOAT)];
    CGFloat textX = padding;
    CGFloat textY = CGRectGetMaxY(_iconF) + padding;
    _textF = (CGRect){{textX, textY}, textSize};
    
    //设置配图
    if (self.status.picture) {//有配图才需要设置
        CGFloat picY = CGRectGetMaxY(self.textF) + padding;
        CGFloat picX = padding;
        CGFloat picW = 100;
        CGFloat picH = 100;
        _picF = CGRectMake(picX, picY, picW, picH);
    }
    
    //设置cell的高度
    if (self.status.picture) {
        _cellHeight = CGRectGetMaxY(self.picF) + padding;
    }else {
        _cellHeight = CGRectGetMaxY(self.textF) + padding;
    }
}

@end
