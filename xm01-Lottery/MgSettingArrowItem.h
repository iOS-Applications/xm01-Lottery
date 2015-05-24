//
//  MgSettingArrowItem.h
//  xm01-Lottery
//
//  Created by GDUT on 15/5/19.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgSettingItem.h"

@interface MgSettingArrowItem : MgSettingItem
// 点击那个cell要做的事情
@property (nonatomic, assign) Class destVcClass;

// 传递目标控制器，箭头Item需要跳转
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
@end
