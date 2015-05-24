//
//  MgSettingArrowItem.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/19.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgSettingArrowItem.h"

@implementation MgSettingArrowItem

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    MgSettingArrowItem *item = [super itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}
@end
