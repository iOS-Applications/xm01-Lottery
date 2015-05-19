//
//  MgSettingItem.h
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.

// 每一个cell都应一个MJSettingItem模型
#import <Foundation/Foundation.h>

@interface MgSettingItem : NSObject

// 图标
@property (nonatomic, copy) NSString *icon;
// 标题
@property (nonatomic, copy) NSString *title;
// 点击那个cell要做的事情
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
@end
