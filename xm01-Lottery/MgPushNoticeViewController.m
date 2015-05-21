//
//  MgNoticeViewController.m
//  xm01-Lottery
//
//  Created by GDUT on 15/5/18.
//  Copyright (c) 2015年 GDUT. All rights reserved.
//

// 推送和提醒控制器
#import "MgPushNoticeViewController.h"
#import "MgSettingArrowItem.h"
#import "MgSettingSwitchItem.h"
#import "MgSettingGroup.h"
#import "MgSettingCell.h"
#import "MgAwardPushViewController.h"
#import "MgAwardAnimViewController.h"
#import "MgScoreTimeViewController.h";

@implementation MgPushNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 不用设置title、添加数据(只有一组)
    [self group0];
    
}

- (void)group0
{
    MgSettingItem *pushNotice1 = [MgSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" destVcClass:[MgAwardPushViewController class]];
    MgSettingItem *pushNotice2 = [MgSettingArrowItem itemWithIcon:nil title:@"中奖动画" destVcClass:[MgAwardAnimViewController class]];
    MgSettingItem *pushNotice3 = [MgSettingArrowItem itemWithIcon:nil title:@"比分直播提示" destVcClass:[MgScoreTimeViewController class]];
    MgSettingItem *pushNotice4 = [MgSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
    
    MgSettingGroup *group = [[MgSettingGroup alloc] init];
    group.items = @[pushNotice1, pushNotice2, pushNotice3, pushNotice4];
    
    [self.data addObject:group];
    
}
@end
