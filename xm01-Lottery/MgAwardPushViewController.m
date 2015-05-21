//
//  MgAwardPushViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/21.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

#import "MgAwardPushViewController.h"
#import "MgSettingGroup.h"
#import "MgSettingSwitchItem.h"


@interface MgAwardPushViewController ()

@end

@implementation MgAwardPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self group0];
}

- (void)group0
{
    MgSettingItem *ball = [MgSettingSwitchItem itemWithIcon:nil title:@"双色球"];
    MgSettingItem *letou = [MgSettingSwitchItem itemWithIcon:nil title:@"大乐透"];
    
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    group.items = @[ball, letou];
    group.header = @"打开设置即可在开奖后立即收到推送消息,获知开奖号码";
    [self.data addObject:group];
}

@end
