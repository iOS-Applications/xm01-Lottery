//
//  MgSettingItem.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgSettingItem.h"

@implementation MgSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    MgSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title= title;
    item.destVcClass = destVcClass;
    
    return item;
}

@end