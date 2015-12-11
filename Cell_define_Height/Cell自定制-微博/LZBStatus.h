//
//  LZBStatus.h
//  Cell自定制-微博
//
//  Created by ZBLi on 15/10/26.
//  Copyright (c) 2015年 ZBLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZBStatus : NSObject

@property (nonatomic, copy) NSString * text;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) BOOL vip;
@property (nonatomic, copy) NSString * picture;

+ (instancetype)statusWithDictionary:(NSDictionary *)dic;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
