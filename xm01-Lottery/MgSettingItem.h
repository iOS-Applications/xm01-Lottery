//
//  MgSettingItem.h
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.

// 每一个cell都应一个MJSettingItem模型
typedef void (^MgSettingItemOption)();
#import <Foundation/Foundation.h>

@interface MgSettingItem : NSObject
// 图标
@property (nonatomic, copy) NSString *icon;
// 标题
@property (nonatomic, copy) NSString *title;
// 点击那个cell需要做的什么事情
@property (nonatomic, copy) MgSettingItemOption option;

//+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
@end
