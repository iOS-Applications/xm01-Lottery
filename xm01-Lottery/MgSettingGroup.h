//
//  MgSettingGroup.h
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MgSettingGroup : NSObject
// 头部标题
@property (nonatomic, copy) NSString *header;
// 尾部标题
@property (nonatomic, copy) NSString *footer;
// 在这组中所有行的数据模型(都是MgSettingItem对象)
@property (nonatomic, strong) NSArray *items;
@end
